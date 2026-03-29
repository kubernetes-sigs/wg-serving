# Gemma-2b AWS

## Configuration
| Kind | Model Server | Model | Provider | Accelerator |
| --- | --- | --- | --- | --- |
| Deployment | vLLM | gemma-2b | AWS | GPU L4 |

## Usage

The template can be deployed with the following commands:

```
kustomize build core/deployment/vllm/gemma-2b/aws | kubectl apply -f -
```
