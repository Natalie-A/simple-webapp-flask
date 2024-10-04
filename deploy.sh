#!/bin/bash

# Exit on error
set -e

# Create Kind cluster
sudo kind create cluster --name webapp

# Load Docker image into Kind
sudo docker pull natalieaoya/flask.webapp:latest
sudo kind load docker-image natalieaoya/flask.webapp:latest --name webapp

# Apply Kubernetes manifest
mkdir ~/.kube
sudo kind get kubeconfig --name webapp > ~/.kube/config
kubectl apply -f k8s-deployment.yaml
kubectl port-forward svc/flask-service 8080:80

# Wait a few seconds for port forwarding to establish
sleep 5
