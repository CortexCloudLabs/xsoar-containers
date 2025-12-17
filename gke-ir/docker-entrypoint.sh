#!/bin/bash
set -e

# Authenticate using the mounted key file
# We assume the key will be mounted to /tmp/service-account.json
echo "Authenticating..."
gcloud auth activate-service-account --key-file=/tmp/service-account.json

# Configure gke plugin
# gcloud components install gke-gcloud-auth-plugin

# Configure the project ID if provided as an environment variable
if [ -n "$GCP_PROJECT" ]; then
    gcloud config set project "$GCP_PROJECT"
fi

# We check if GKE_CLUSTER_NAME is provided.
if [ -n "$GKE_CLUSTER_NAME" ] && [ -n "$GKE_ZONE" ]; then
    echo "Getting GKE Credentials for $GKE_CLUSTER_NAME in $GKE_ZONE..."
    gcloud container clusters get-credentials "$GKE_CLUSTER_NAME" --zone "$GKE_ZONE"
fi

# Execute the user's command
# "$@" represents all arguments passed to the docker run command
echo "Running command: $@"
exec "$@"