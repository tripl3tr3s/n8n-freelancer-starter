# Ultra-Lean n8n Dockerfile for Railway with Volume Support
FROM n8nio/n8n:latest

# Run as root for volume write permissions (Railway volumes mount as root)
# Data will be stored at /root/.n8n
USER root

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:5678/healthz || exit 1

# Expose port
EXPOSE 5678