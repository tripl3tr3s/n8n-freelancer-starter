# Ultra-Lean n8n Dockerfile for Railway with Volume Support
FROM n8nio/n8n:latest

# Switch to root to handle volume permissions
USER root

# Create data directory
RUN mkdir -p /home/node/.n8n

# Install su-exec for user switching
RUN apk add --no-cache su-exec

# Create entrypoint script using cat with heredoc (more reliable)
RUN cat > /entrypoint.sh << 'EOF'
#!/bin/sh
# Fix ownership of mounted volume
chown -R node:node /home/node/.n8n 2>/dev/null || true
# Start n8n as node user
exec su-exec node n8n start
EOF

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:5678/healthz || exit 1

# Expose port
EXPOSE 5678

# Use custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]