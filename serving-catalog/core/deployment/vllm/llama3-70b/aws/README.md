# LLaMA3-70B AWS

## Configuration
| Kind | Model Server | Model | Provider | Accelerator |
| --- | --- | --- | --- | --- |
| Deployment | vLLM | llama3-70b | AWS | GPU L4 |

## Usage

The template can be deployed with the following commands:

```
kustomize build core/deployment/vllm/llama3-70b/aws | kubectl apply -f -
```
