#!/bin/bash

# Ensure that the Google Cloud Project ID is provided
if [ -z "$gcp_project_id" ]; then
  echo "Error: gcp_project_id is not set."
  exit 1
fi

if [ -z "$api_service" ]; then
  echo "Error: api_service is not set."
  exit 1
fi

# Check if the service API is enabled
ENABLED=$(gcloud services list --enabled --filter="$api_service" --format="value(NAME)")

if [ "$ENABLED" == "$api_service" ]; then
  echo "$api_service is already enabled."
  ENABLE_API="false"
else
  echo "$api_service is not enabled."
  ENABLE_API="true"
fi

# If the API is not enabled, enable it
if [ "$ENABLE_API" == "true" ]; then
  echo "Enabling $api_service..."
  gcloud services enable "$api_service" --project="$gcp_project_id"
  echo "$api_service enabled."
fi

# Verify Service API status
gcloud services list --enabled --filter="$api_service" --format="value(NAME)"
echo "Verified $api_service is enabled."
