## GKE Containment

```shell
docker run --rm -v ~/<sa-json-key.json> -e GCP_PROJECT=<project_id> -e GKE_CLUSTER_NAME=<cluster_name> -e GKE_ZONE=us-central1 -e NAMESPACE=<namespace> -e PODNAME=<podname>> <container_image_name> containment.sh
```