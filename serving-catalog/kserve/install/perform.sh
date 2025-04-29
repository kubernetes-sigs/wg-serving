#!/bin/bash

set -eo pipefail

CERT_MANAGER_VERSION=v1.9.0
KSERVE_VERSION=v0.14.0


# Function to clean up resources
cleanup() {
  echo "Cleaning up resources..."
  kubectl delete -f https://github.com/kserve/kserve/releases/download/${KSERVE_VERSION}/kserve.yaml || true
  kubectl delete -f https://github.com/jetstack/cert-manager/releases/download/${CERT_MANAGER_VERSION}/cert-manager.yaml
  echo "Cleanup completed."
}


if [ "$1" == "cleanup" ]; then
  cleanup
  exit 0
fi

# Install cert-manager
kubectl apply --validate=true -f https://github.com/jetstack/cert-manager/releases/download/${CERT_MANAGER_VERSION}/cert-manager.yaml
kubectl wait --for=condition=available --timeout=600s deployment/cert-manager-webhook -n cert-manager

# Install KServe
kubectl apply --validate=true -f https://github.com/kserve/kserve/releases/download/${KSERVE_VERSION}/kserve.yaml
kubectl wait --for=condition=ready pod -l control-plane=kserve-controller-manager -n kserve --timeout=300s

# default to raw deployment
cat <<EOF > deploy-config-patch.yaml
data:
  deploy: |
    {
      "defaultDeploymentMode": "RawDeployment"
    }
EOF
kubectl patch cm inferenceservice-config -n kserve --type=merge --patch-file=deploy-config-patch.yaml

