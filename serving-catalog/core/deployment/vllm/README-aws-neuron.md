# AWS Neuron (Inferentia2) — vLLM overlays

These kustomize overlays deploy the shared vLLM blueprint on **AWS Inferentia2** (`inf2.*`)
instead of GPU. Model weights come from **S3** (read-only mount); the cluster must run the
Mountpoint S3 CSI driver and Neuron device plugin (see PKB notes below).

Each model: `core/deployment/vllm/<model>/aws-neuron`

| Model | Status |
| --- | --- |
| llama3-8b | Tested end-to-end (`inf2.24xlarge`, 250Gi / 300Gi memory) |
| tinyllama-1b | Smoke test (`inf2.8xlarge`, 60Gi / 80Gi) |
| gemma-2b | Manifest only — **not tested** on Neuron; same sizing as tinyllama for now |

```bash
# from serving-catalog/
kustomize build core/deployment/vllm/llama3-8b/aws-neuron
kustomize build core/deployment/vllm/tinyllama-1b/aws-neuron
```

**Catalog components** (passed to `wg-serving` / PKB as `catalog_components`):

- `1-Inf2` — one Inferentia2 chip, 2 NeuronCores, tensor parallel size 2
- `s3` — model files from S3 under `/data/models`

**PKB:** `catalog_provider=aws-neuron`, `catalog_components=1-Inf2,s3`

## Why some env vars look odd

Patches set only what differs from the GPU-oriented base. Two common questions:

**Why is `TENSOR_PARALLEL_SIZE` missing from the patch?**  
It is set by the `1-Inf2` component (`TP=2`). On Inferentia2 you cannot use `TP=1`:
the Neuron compiler needs both cores on the chip (`--lnc>=2`), otherwise `neuronx-cc` fails.

**Why `VLLM_USE_V1=0`?**  
The S3 storage component turns on vLLM’s v1 engine (`VLLM_USE_V1=1`) for GPU builds. On Neuron
we force v0 — v1 targets the GPU compile path and is not what we run here.

## Extra vLLM args (`kustomization.yaml`)

These JSON patches add CLI flags to the container (same on all models):

**`--max-model-len=2048`** — vLLM 0.13+ on Neuron requires an explicit max context length.
2048 keeps compile and memory lower than longer defaults; enough for typical PKB workloads.

**`--no-enable-prefix-caching`** — v0.13 enables prefix caching by default. On Neuron that path
expects `block_size`, which we do not set; the server fails validation unless caching is off.

Full runbook (flags, S3, IAM, debugging): PerfKitBenchmarker fork — `Notes/PKB/aws/TPU/`.
