# Build n8n with FFmpeg installed
FROM n8nio/n8n:latest

# Switch to root user to install packages
USER root

# Install ffmpeg and clean up
RUN apt-get update \
  && apt-get install -y --no-install-recommends ffmpeg \
  && rm -rf /var/lib/apt/lists/*

# Switch back to the regular n8n user
USER node
