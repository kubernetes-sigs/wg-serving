# serving-catalog

This repository is a catalog of Kustomize templated yamls for deploying inference workloads.

## Context

The intention of the serving-catalog is:

    - Crowdsource known working configurations for serving LLM/GenAI on K8s.
    - Reduce barrier to entry and serve as reference configurations for production deployments.
    - Help identify similarities and differences between frameworks, model servers, and providers used in LLM serving to inform future upstream K8s changes.

## Contributions

All known working configurations are welcome. New top level directories should be created under serving-catalog for new frameworks. The core directory is meant to house examples using minimal k8s based mechanism.

It is recommended to follow the kustomize base/overlay structure `serving-catalog/{platform}/{crd}/{model_server}/{model}/{provider}` shown in core. Provider specific references should be placed in provider specific directories. Components can be used to share common configurations across overlays.

## Information and Usage

Kustomize overlays and components are leveraged to share common configurations across deployment paradigms, model servers, and models. The directory structure reflects this hierarchy:

```
serving-catalog/
├── core
│   ├── deployment
│   │   ├── base
│   │   ├── components
│   │   │   └── policies
│   │   │       └── resources
│   │   │           ├── gpu
│   │   │           │   ├── 1-L4
│   │   │           │   └── 2-L4
│   │   │           └── tpu
│   │   │               └── v5e-2x4
│   │   ├── jetstream
│   │   │   ├── base
│   │   │   └── gemma-7b-it
│   │   │       ├── base
│   │   │       └── gke
│   │   └── vllm
│   │       ├── base
│   │       └── gemma-2b
│   │           ├── base
│   │           └── gke
```

Where an inference deployment can be deployed using a command like:

```
kustomize build core/deployment/vllm/gemma-2b | kubectl apply -f -
```

For models and model servers that require a model load stage, these commands kustomize and deploys a Job, waits for it to complete and then deploys the inference server.

```
kustomize build core/deployment/jetstream/gemma-7b-it | kubectl apply -f - --selector prerequisite=model-load &&
kubectl wait --for=condition=complete --timeout=1000s job/gemma-7b-it-jetstream-data-loader &&
kustomize build core/deployment/jetstream/gemma-7b-it | kubectl apply -f - --selector app=gemma-7b-it-jetstream-inference-server
```