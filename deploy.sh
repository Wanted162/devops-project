#!/bin/bash

# Stop on first error
set -e

echo "🚀 Deploying with docker-compose..."

# Bring down existing containers (if any)
docker-compose down

# Rebuild and start fresh
docker-compose up -d --build

echo "✅ Deployment complete. App running on port 80."
