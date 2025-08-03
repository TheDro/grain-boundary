# Shard Head 💎
Proof of concept for sharding kubenetes pods for added application resilience. It uses a similar pattern to the bulkhead pattern to passively prevent the whole app from failing whenever a single endpoint is slow.

This repo contains the kubernetes configuration for the sharding as well as dummy Rails app with a few different API endpoints for testing.