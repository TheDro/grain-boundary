# Grain Boundary 💎
Proof of concept for sharding kubenetes pods for added application resilience. It uses a similar pattern to the bulkhead pattern to passively prevent the whole app from failing whenever a single endpoint is slow.

This repo contains the kubernetes configuration for the sharding as well as dummy Rails app with a few different API endpoints for testing.

## How to run

For testing the docker containers locally:

```bash
docker build -t grain-boundary . && \
docker run -p 8080:2000 grain-boundary
```

For testing the kubernetes deployment:

```bash
# start minikube
# start docker desktop
minikube start

# update docker image
docker build -t andrewsc32/grain-boundary .
docker push andrewsc32/grain-boundary

# update kubernetes config
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# update deployment
kubectl rollout restart deployment grain-boundary

# expose app
minikube service --all
```

For testing the connection handling:

```bash
cd javascript
vite
```