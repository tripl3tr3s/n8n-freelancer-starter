# Ultra-Lean n8n Dockerfile for Railway with Volume Support
FROM n8nio/n8n:latest

# Switch to root to handle volume permissions
USER root

# Create data directory
RUN mkdir -p /home/node/.n8n

# Create entrypoint script that fixes permissions on startup
RUN echo '#!/bin/sh\n\
  # Fix ownership of mounted volume\n\
  chown -R node:node /home/node/.n8n 2>/dev/null || true\n\
  # Start n8n as node user\n\
  exec su-exec node n8n start' > /entrypoint.sh && \
  chmod +x /entrypoint.sh

# Install su-exec for user switching (if not already present)
RUN apk add --no-cache su-exec 2>/dev/null || true

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:5678/healthz || exit 1

# Expose port
EXPOSE 5678

# Use custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]