#!/bin/bash
set -e

# Validate that the NAMESPACE variable is set
if [ -z "$NAMESPACE" ]; then
  echo "Error: NAMESPACE environment variable is not set."
  echo "Usage: docker run -e NAMESPACE=target-ns ..."
  exit 1
fi

echo "Applying quarantine policy to namespace: $NAMESPACE"
envsubst < /usr/local/bin/quarantine-policy.yaml | kubectl --insecure-skip-tls-verify=true apply -f -


echo "Quarantine pod: $PODNAME"
kubectl --insecure-skip-tls-verify=true label pod $PODNAME quarantine=true
