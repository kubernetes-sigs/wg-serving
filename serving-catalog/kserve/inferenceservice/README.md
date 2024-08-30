# KServe Inference Services

This directory contains the list of KServe InferenceServices.



# sklearn-iris inference call

To consume the inference service, you can use the following command:

```shell
curl -X POST  -H "Content-Type: application/json" \
  -d @payloads/sklearn-iris.json \
  --resolve "sklearn-iris-kserve-test.example.com:80:192.168.105.2"  \ 
  http://sklearn-iris-kserve-test.example.com/v1/models/sklearn-iris:predict
```

The `resolve` parameter is used to resolve the dns name for the endpoint managed by the IngressClass in your cluster.

The output should be something similar to:

```JSON
{
  "predictions": [
    1, 1
  ]
}
```

