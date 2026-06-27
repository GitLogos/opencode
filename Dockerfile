FROM node:24-slim

# Runtime tools opencode expects
RUN apt-get update \
 && apt-get install -y --no-install-recommends ripgrep git ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Install the published opencode CLI (pulls the latest release at build time)
RUN npm install -g opencode-ai

# Serve the web UI
EXPOSE 4096
ENTRYPOINT ["opencode"]
CMD ["web", "--hostname", "0.0.0.0", "--port", "4096"]
