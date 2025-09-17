# llama3-8b

## Configuration
| Kind | Model Server | Model | Provider | Accelerator |
| --- | --- | --- | --- | --- |
| Deployment | JetStream-Maxtext | llama3-8b | GKE | TPU v5e 2x4 |

## Usage
$BUCKET_NAME must be replaced in `../base/job.patch.yaml` and `deployment.patch.yaml`
$META_URL must be replaced in `../base/job.patch.yaml`

The example can be deployed by issuing the commands:

```
kustomize build core/deployment/jetstream/maxtext/llama3-8b/gke | kubectl apply -f - --selector prerequisite=model-load &&
kubectl wait --for=condition=complete --timeout=1000s job/llama3-8b-jetstream-data-loader &&
kustomize build core/deployment/jetstream/maxtext/llama3-8b/gke | kubectl apply -f - --selector app=llama3-8b-jetstream-inference-server
```
