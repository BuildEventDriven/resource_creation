# 📌 Instance Management Repository 🚀

This repository is responsible for provisioning and managing remote instances, ensuring:
- ✅ Automated & manual instance creation (Terraform + Bash Scripts)
- ✅ Multi-instance configuration (Kafka brokers, future expansions)
- ✅ Logging & monitoring (Prometheus & Grafana) (Initial set-up scripts only)
- ✅ CI/CD automation for Terraform validation & deployment

### ** Setup the Environment**
Initialize the environment variables and dependencies.

```sh
chmod +x setup_env.sh
./setup_env.sh
```

## 🔧 Setup & Usage
### ✅ Pre-commit Hooks
Install pre-commit hooks to enforce code standards:
```sh
pip install pre-commit
pre-commit install
```
Once done!
- source venv/bin/activate to enter the virtual environment
- pre-commit run --all-files to test hooks

🚨 **Mac OS Required**
- This setup is designed to run on **Mac OS**.
- If you are using a different OS, you may encounter issues with the following dependencies:
  - `direnv`
  - `google-cloud-cli`

## 🤖 CI/CD Pipeline
This repository includes a GitHub Actions workflow that:
- 🚀 Validates Terraform configurations
- 🚀 Checks Shell Scripts (ShellCheck)
- 🚀 Runs health-check scripts

Example workflow-action-flow:
```
terraform-project/
├── terraform-scripts/
│   ├── create-instance/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── delete-instance/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
├── .github/
│   ├── workflows/
│   │   ├── create-instance.yml
│   │   └── delete-instance.yml
│   ├── actions/
│   │   └── terraform-setup/
│   │       ├── action.yml
│   │       └── script.sh
```
---

**Maintainer:** Karan Patel