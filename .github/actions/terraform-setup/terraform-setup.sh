#!/bin/bash

# Ensure the directory for Terraform setup is provided
if [ -z "$TERRA_DIRECTORY" ]; then
  echo "Error: TERRA_DIRECTORY is not set."
  exit 1
fi

# Install dependencies
echo "Installing dependencies..."
python -m pip install --upgrade pip
while IFS= read -r package || [[ -n "$package" ]]; do
  # Ignore comments and empty lines in requirements.txt
  if [[ "$package" =~ ^#.*$ || -z "$package" ]]; then continue; fi
  pip show "$package" > /dev/null 2>&1 || pip install "$package"
done < requirements.txt

# Install shellcheck (for shell scripting linting)
echo "Installing shellcheck..."
sudo apt-get update
sudo apt-get install -y shellcheck

# Install Terraform
echo "Setting up Terraform..."
terraform_version="1.3.7"
curl -fsSL "https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip" -o terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin/

# Terraform init and validate
echo "Initializing Terraform..."
terraform init -input=false -backend=false -upgrade \
  -var-file=terraform.auto.tfvars \
  -chdir="${GITHUB_WORKSPACE}/terraform-scripts/${TERRA_DIRECTORY}"

echo "Validating Terraform configuration..."
terraform validate \
  -chdir="${GITHUB_WORKSPACE}/terraform-scripts/${TERRA_DIRECTORY}"
