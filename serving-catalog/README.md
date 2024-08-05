# serving-catalog

This repository is a catalog of Kustomize templated yamls for deploying inference workloads.

## Information and Usage

Kustomize overlays and components are leveraged to share common configurations across deployment paradigms, model servers, and models. The directory structure reflects this hierarchy:

```
serving-catalog/
└── singlehost
    ├── base
    ├── components
    │   └── policies
    │       └── resources
    │           ├── gpu
    │           │   ├── 1-L4
    │           └── tpu
    │               └── v5e-2x4
    └── model_servers
        ├── jetstream
        │   ├── base
        │   └── models
        │       └── gemma-7b-it
        └── vllm
            ├── base
            └── models
                ├── gemma-2b
```

Where an inference deployment can be deployed using a command like:

```
kustomize build core/deployment/model_servers/vllm/models/gemma-2b | kubectl apply -f -
```

For models and model servers that require a model load stage, these commands kustomize and deploys a Job, waits for it to complete and then deploys the inference server.

```
kustomize build core/deployment/model_servers/jetstream/models/gemma-7b-it | kubectl apply -f - --selector prerequisite=model-load &&
kubectl wait --for=condition=complete --timeout=1000s job/gemma-7b-it-jetstream-data-loader &&
kustomize build core/deployment/model_servers/jetstream/models/gemma-7b-it | kubectl apply -f - --selector app=gemma-7b-it-jetstream-inference-server
```