# Gemma-2b

## Configuration
| Kind | Model Server | Model | Provider | Accelerator |
| --- | --- | --- | --- | --- |
| Deployment | vLLM | gemma-2b | GKE | GPU L4 |

## Usage

The template can be deployed with the following commands:

```
kustomize build core/deployment/jetstream/gemma-7b-it/gke | kubectl apply -f -
```