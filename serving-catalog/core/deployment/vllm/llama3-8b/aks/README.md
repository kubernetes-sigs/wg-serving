# llama3-8b

## Configuration
| Kind | Model Server | Model | Provider | Accelerator |
| --- | --- | --- | --- | --- |
| Deployment | vLLM | llama3-8b | AKS | GPU V100 |

## Usage

The template can be deployed with the following commands:

```
kustomize build core/deployment/vllm/llama3-8b/aks | kubectl apply -f -
```