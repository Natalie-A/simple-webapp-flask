# Flask Web App Deployment

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
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
http://<IP>:5000                            => Welcome
http://<IP>:5000/how%20are%20you            => I am good, how about you?
```
