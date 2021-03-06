#!/bin/bash

# create gke cluster
# https://istio.io/docs/setup/kubernetes/sidecar-injection.html#pod-spec-requirements

# create gke cluster
gcloud beta container \
  clusters create "voter-api-istio-demo" \
  --project "voter-api-kub-demo" \
  --enable-kubernetes-alpha \
  --cluster-version "1.8.4-gke.1" \
  --username="admin" \
  --zone "us-east1-b" \
  --node-locations "us-east1-b","us-east1-c","us-east1-d" \
  --machine-type "n1-standard-1" \
  --num-nodes "1" \
  --labels environment=development \
  --enable-cloud-logging \
  --enable-cloud-monitoring

# get cluster credentials
gcloud container clusters get-credentials voter-api-istio-demo \
  --zone us-east1-b --project voter-api-kub-demo
