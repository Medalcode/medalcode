# 🐳 Containerized Test Environment for Medalcode Scripts
FROM alpine:3.20

# Install Bash, ImageMagick, Git, and Coreutils for reproducible testing
RUN apk add --no-cache bash git imagemagick coreutils python3

WORKDIR /app

COPY . /app

RUN chmod +x generate-assets.sh git_sync.sh tests/test_scripts.sh

ENTRYPOINT ["/bin/bash", "./tests/test_scripts.sh"]
