# KServe Serving

For the KServe examples exposed in this Serving Catalog, we will focus on the simplicity and detachment of most of the
underlying infrastructure. This will allow us to focus on the pure Serving aspect of the examples.

The `RawDeployment` method will be used to deploy the models. This method is the simplest way to deploy a model which
does not have any dependency, like the `Serveless` method, which depends on Istio and Knative.

For more information about `RawDeployment` and other deployment methods, please refer to the [KServe documentation](https://kserve.github.io/website/latest/admin/kubernetes_deployment/).


## Cert Manager and KServe

The installation script will install the `cert-manager` and `KServe` controller, plus, configure the default\
`Ingress Class` to `NGinx`, which is the default used on Minikube.

```shell
install/perform.sh
```

Cleanup:
```shell
install/perform.sh cleanup
```

After it is installed, patch the `Ingress Class` to `nginx` or the one you have selected:
```shell
export INGRESS_CLASS_NAME=nginx
kubectl patch cm inferenceservice-config -n kserve --type=merge --patch-file=patches/ingress-patch.yaml
```


# TODOs

- [ ] Add a inference service for vllm - kustomize
- [ ] Add a inference service for iris - kustomize
- [X] Add script to install KServe and the CertManager dependency
- [ ] find a way to deploy the serving runtime together the example
- [ ] Add custom Serving Runtimes