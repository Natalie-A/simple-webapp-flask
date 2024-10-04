# Simple Flask Web App

## Description

This is a simple web application using Flask and MySQL that demonstrates a RESTful API.

## Containerization

The app is containerized using Docker. The Dockerfile does the following:

- Starts from a lightweight base image that supports Flask.
- Installs Python 3 and necessary dependencies.
- Copies the application code to the container.
- Sets the entry point to run the Flask app on port 8080.

## CI/CD Process

The Continuous Integration and Continuous Deployment (CI/CD) process for this Flask app is set up using GitHub Actions. Here are the key steps:

### 1. Triggering the Pipeline

- The CI/CD pipeline is triggered automatically when code is pushed to the `master` branch.

### 2. Build Stage

- **Checkout Code**: The code from the repository is checked out.
- **Set Up Docker Buildx**: Prepares the environment for building Docker images.
- **Login to Docker Hub**: Authenticates with Docker Hub using stored credentials.
- **Build Docker Image**: A Docker image is built from the Dockerfile and tagged as `natalieaoya/flask.webapp:latest`.
- **Push Docker Image**: The built image is pushed to Docker Hub for storage.

### 3. Deploy Stage

- **Set Up Kind**: Initializes a Kind (Kubernetes in Docker) cluster.
- **Create Kind Cluster**: A new cluster named `webapp` is created.
- **Load Docker Image**: The latest Docker image is loaded into the Kind cluster.
- **Apply Kubernetes Manifests**: The Kubernetes deployment and service configurations are applied, launching the application in the cluster.


## Deployment on Kubernetes

The Flask API has been deployed on a Kubernetes cluster using the following components:

- **Docker**: The application is containerized using a Docker image, built from a simple Dockerfile that installs Flask and runs the app.
- **Kubernetes Deployment**: The application is managed via a Kubernetes Deployment, which allows for scaling and self-healing of the application.
- **Service**: A Kubernetes Service of type `NodePort` is used to expose the API externally, allowing it to be accessed from outside the cluster.

### Security Measures

- **Minimal Base Image**: The application uses a lightweight base image to reduce the attack surface.

- **Non-Root User in Dockerfile**: The Flask application runs as a non-root user within the Docker container to minimize the risk of privilege escalation attacks.

- **Non-Root User in Kubernetes Manifest**: The Kubernetes manifest specifies a non-root user and group ID for Pods, to restrict permissions and protecting the cluster from unauthorized access.

- **Network Policies**: Network policies are implemented to control traffic between services, ensuring that only authorized Pods can communicate with the Flask application.

# Flask Web App Deployment

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/engine/install/)
- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Deployment Instructions

## 1. Clone the repository:
   ```bash
   git clone https://github.com/Natalie-A/simple-webapp-flask.git
   cd simple-webapp-flask
   chmod +x deploy.sh
   ./deploy.sh
   ```

## 2. Test

Open a browser and go to URL
```
http://localhost:8080                           => Welcome
http://localhost:8080/how%20are%20you            => I am good, how about you?
```
