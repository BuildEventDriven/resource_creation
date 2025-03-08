#!/bin/bash

# Ensure that GCP service account key and project ID are provided
if [ -z "$GCP_SA_KEY" ]; then
  echo "Error: GCP_SA_KEY is not set."
  exit 1
fi

if [ -z "$GCP_PROJECT" ]; then
  echo "Error: GCP_PROJECT is not set."
  exit 1
fi

# Save the GCP service account key to a temporary file and format with jq
echo "$GCP_SA_KEY" | jq '.' > /tmp/gcp-key.json

# Authenticate using the service account key
gcloud auth activate-service-account --key-file=/tmp/gcp-key.json

# Set the project ID for gcloud commands
gcloud config set project "$GCP_PROJECT"

# List active Google Cloud accounts for confirmation
gcloud auth list

# Clean up
rm /tmp/gcp-key.json

echo "Google Cloud authentication successful."
