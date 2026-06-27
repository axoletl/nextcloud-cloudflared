FROM nextcloud:latest

RUN apt-get update && \
    apt-get install --yes --no-install-recommends ffmpeg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
