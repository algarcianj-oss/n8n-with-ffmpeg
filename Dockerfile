# Use the official n8n image
FROM n8nio/n8n:latest

# Become root to install packages
USER root

# Try common package managers to install ffmpeg (works for Debian/Ubuntu or Alpine)
RUN set -eux; \
    if command -v apt-get >/dev/null 2>&1; then \
        apt-get update && \
        apt-get install -y --no-install-recommends ffmpeg && \
        rm -rf /var/lib/apt/lists/*; \
    elif command -v apk >/dev/null 2>&1; then \
        apk add --no-cache ffmpeg; \
    elif command -v microdnf >/dev/null 2>&1; then \
        microdnf install -y ffmpeg; \
    elif command -v dnf >/dev/null 2>&1; then \
        dnf install -y ffmpeg; \
    elif command -v yum >/dev/null 2>&1; then \
        yum install -y ffmpeg; \
    else \
        echo "No supported package manager found to install ffmpeg" && exit 1; \
    fi

# Drop back to the n8n user
USER node
