# LLaMA3-8B Azure

## Configuration
| Kind | Model Server | Model | Provider | Accelerator |
| --- | --- | --- | --- | --- |
| Deployment | vLLM | llama3-8b | Azure | GPU H100 |

## Usage

The template can be deployed with the following commands:

```
kustomize build core/deployment/vllm/llama3-8b/azure | kubectl apply -f -
```