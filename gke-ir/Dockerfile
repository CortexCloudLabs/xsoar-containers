# Use the official Google Cloud SDK image
FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:latest

# 1. Install gettext-base (Standard Debian package) via apt-get
RUN apt-get update && apt-get install -y \
    gettext-base \
    curl \
    && rm -rf /var/lib/apt/lists/

# Copy files to a standard path in the container
COPY docker-entrypoint.sh /usr/local/bin/
COPY quarantine-policy.yaml /usr/local/bin/

COPY containment.sh /usr/local/bin/

# Make the scripts executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh /usr/local/bin/containment.sh

# Set the entrypoint to our auth wrapper
ENTRYPOINT ["docker-entrypoint.sh"]

# Default command
CMD ["gcloud", "--help"]