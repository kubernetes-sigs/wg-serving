# Llama-70b

## Configuration
| Kind | Model Server | Model | Provider | Accelerator |
| --- | --- | --- | --- | --- |
| Deployment | vLLM | llama3-70b | GKE | GPU H100 80GB Mega |

## Usage

The template can be deployed with the following commands:

```
kustomize build core/deployment/vllm/llama3-70b/gke/lmcache/local-disk| kubectl apply -f -
```