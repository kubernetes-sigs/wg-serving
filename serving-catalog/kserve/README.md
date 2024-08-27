# KServe Serving

For the KServe examples exposed in this Serving Catalog, we will focus on the simplicity and detachment of most of the \n
underlying infrastructure. This will allow us to focus on the pure Serving aspect of the examples. 

The `RawDeployment` method will be used to deploy the models. This method is the simplest way to deploy a model which \n 
does not have any dependency, like the `Serveless` method, which depends on Istio and Knative.

For more information about `RawDeployment` and other deployment methods, please refer to the [KServe documentation](https://kserve.github.io/website/latest/admin/kubernetes_deployment/).



# TODOs

- [ ] Add the inference services
- [ ] Use kustomize to deploy the runtimes and inference services
- [ ] Update the catalog once the examples are ready
- [ ] Update the validate script to check the KServe examples
- [ ] Update the catalog.md once the inference services and the kustomize deployment are ready
- [ ] Add custom Serving Runtimes