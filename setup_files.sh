#!/bin/bash

# 1. Create Dockerfile
cat << 'DOCKERFILE_END' > Dockerfile
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
DOCKERFILE_END

# 2. Create docker-compose.yml
cat << 'COMPOSE_END' > docker-compose.yml
version: '3.8'

services:
  agentguard-ai:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: agentguard_ai_app
    ports:
      - "8080:80"
    restart: unless-stopped
COMPOSE_END

# 3. Create run.sh
cat << 'RUN_END' > run.sh
#!/bin/bash
sudo systemctl start docker 2>/dev/null || true
echo "Building and launching AgentGuard AI container..."
docker compose up -d --build
echo "------------------------------------------------"
echo "AgentGuard AI is now running!"
echo "Access the dashboard at:"
echo "  Local:   http://localhost:8080"
echo "  Network: http://$(hostname -I | awk '{print $1}'):8080"
echo "------------------------------------------------"
RUN_END

chmod +x run.sh
echo "All setup files created successfully!"
