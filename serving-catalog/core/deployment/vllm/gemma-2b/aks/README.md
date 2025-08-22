# Gemma-2b

## Configuration
| Kind | Model Server | Model | Provider | Accelerator |
| --- | --- | --- | --- | --- |
| Deployment | vLLM | gemma-2b | AKS | GPU T4 |

## Usage

The template can be deployed with the following commands:

```
kustomize build core/deployment/vllm/gemma-2b/aks | kubectl apply -f -
```