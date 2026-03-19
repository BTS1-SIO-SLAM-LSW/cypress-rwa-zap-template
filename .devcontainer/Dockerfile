FROM mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm

USER root

# Outils utiles pour les audits Web et l'usage quotidien en Codespaces/devcontainer
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
       curl \
       wget \
       unzip \
       ca-certificates \
       procps \
       net-tools \
       iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Active Corepack et prépare Yarn
RUN corepack enable \
    && corepack prepare yarn@stable --activate

USER node
WORKDIR /workspaces/${LOCAL_WORKSPACE_FOLDER_BASENAME}
