#!/bin/bash

# Ensure that GCP project ID is provided
if [ -z "$gcp_project_id" ]; then
  echo "Error: gcp_project_id is not set."
  exit 1
fi

if [ -z "$authenticate_at_path" ]; then
  echo "Error: authenticate_at_path is not set."
  exit 1
fi

# Authenticate using the service account key
gcloud auth activate-service-account --key-file="$authenticate_at_path"

# Set the project ID for gcloud commands
gcloud config set project "$gcp_project_id"

# List active Google Cloud accounts for confirmation
gcloud auth list

# Clean up
rm "$authenticate_at_path"

echo "Google Cloud authentication successful."
