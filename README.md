# Grain Boundary 💎
Proof of concept for sharding kubenetes pods for added application resilience. It uses a similar pattern to the bulkhead pattern to passively prevent the whole app from failing whenever a single endpoint is slow.

This repo contains the kubernetes configuration for the sharding as well as dummy Rails app with a few different API endpoints for testing.

## How to run

For testing the docker containers locally:

```bash
docker build -t grain-boundary . && \
docker run -p 8080:2000 grain-boundary
```