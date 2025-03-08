#!/bin/bash

# Ensure that the Google Cloud Project ID is provided
if [ -z "$GCP_PROJECT" ]; then
  echo "Error: GCP_PROJECT is not set."
  exit 1
fi

# Check if Compute Engine API is enabled
ENABLED=$(gcloud services list --enabled --filter="compute.googleapis.com" --format="value(NAME)")

if [ "$ENABLED" == "compute.googleapis.com" ]; then
  echo "Compute Engine API is already enabled."
  ENABLE_COMPUTE_API="false"
else
  echo "Compute Engine API is not enabled."
  ENABLE_COMPUTE_API="true"
fi

# If the API is not enabled, enable it
if [ "$ENABLE_COMPUTE_API" == "true" ]; then
  echo "Enabling Compute Engine API..."
  gcloud services enable compute.googleapis.com --project="$GCP_PROJECT"
  echo "Compute Engine API enabled."
fi

# Verify Compute Engine API status
gcloud services list --enabled --filter="compute.googleapis.com" --format="value(NAME)"
echo "Verified Compute Engine API is enabled."
