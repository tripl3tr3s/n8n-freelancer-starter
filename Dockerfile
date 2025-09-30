# Ultra-Lean n8n Dockerfile for Railway
# Based on official n8n image with optimizations

FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Create data directory with proper permissions
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Switch to node user for security
USER node

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:5678/healthz || exit 1

# Expose port
EXPOSE 5678

# Use default n8n entrypoint
CMD ["n8n", "start"]