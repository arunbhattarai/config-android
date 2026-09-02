FROM mcr.microsoft.com/devcontainers/java:1-17-bookworm

# The stock devcontainer image includes a broken Yarn apt source that prevents
# apt-get update from succeeding. Remove it before any feature installation runs.
RUN rm -f /etc/apt/sources.list.d/yarn.list \
    && rm -f /etc/apt/sources.list.d/yarn.list.save \
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl gnupg \
    && rm -rf /var/lib/apt/lists/*
