#!/bin/bash

# Ensure that the environment variable is set for the service account key
if [ -z "$GCP_SA_KEY" ]; then
  echo "Error: GCP_SA_KEY is not set."
  exit 1
fi

# Save the GCP service account key to a temporary file
echo "$GCP_SA_KEY" > /tmp/gcp-key.json

# Authenticate using the service account key
gcloud auth activate-service-account --key-file=/tmp/gcp-key.json

# Set the project ID for the gcloud command
gcloud config set project $GCP_PROJECT_ID

# Cleanup
rm /tmp/gcp-key.json

# List active Google Cloud accounts for confirmation
gcloud auth list
