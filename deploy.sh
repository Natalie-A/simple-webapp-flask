#!/bin/bash

# Exit on error
set -e

# Create Kind cluster
sudo kind create cluster --name webapp || { echo "Kind cluster already exists."; }

# Load Docker image into Kind
sudo docker pull natalieaoya/flask.webapp:latest
sudo kind load docker-image natalieaoya/flask.webapp:latest --name webapp

# Apply Kubernetes manifests
kubectl apply -f k8s-deployment.yaml

# Wait a few seconds for port forwarding to establish
sleep 5
