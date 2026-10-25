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
