# Ensure that GCP service account key and list of paths are provided
if [ -z "$access_key" ]; then
  echo "Error: access_key is not set."
  exit 1
fi

if [ -z "$path_list" ]; then
  echo "Error: path_list is not set."
  exit 1
fi

# Convert path_list (comma-separated string) into an array
IFS=',' read -r -a paths <<< "$path_list"

# Decode encoded GCP Key
DECODED_KEY=$(echo "$access_key" | base64 --decode)

# Loop through the list of paths and store the GCP key in each path
for path in "${paths[@]}"; do
  echo "$DECODED_KEY" | jq '.' > "$path"
  echo "Saved GCP service account key to $path"
done
