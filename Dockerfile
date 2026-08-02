# Hermes Agent — Lightweight deployment for Render
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl git jq \
  && rm -rf /var/lib/apt/lists/*

# Install Hermes Agent
RUN pip install hermes-agent

# Create working directory
WORKDIR /hermes
RUN mkdir -p /hermes

# Environment variables
ENV HERMES_HOME=/hermes \
    HERMES_TELEMETRY_DISABLED=1 \
    HERMES_NONINTERACTIVE=1

EXPOSE 8000

# Start Hermes gateway
CMD ["hermes", "gateway"]
