## 📂 Repository Structure

---

```
📦 instance-management
├── 📂 infra                   # Infrastructure setup scripts
│   ├── 📄 instance-creation.sh
│   ├── 📄 instance-start.sh
│   ├── 📄 instance-stop.sh
│   ├── 📄 auto-shutdown.sh
│   ├── 📄 logging.sh
├── 📂 terraform-scripts       # Terraform provisioning
│   ├── 📂 network             # Networking setup
│   │   ├── 📄 network.tf
│   ├── 📂 instances/kafka-brokers # Kafka broker instances
│   │   ├── 📄 instance-template.tf   # Common instance settings
│   │   ├── 📄 instance-broker1.tf    # Broker 1 configuration
│   │   ├── 📄 instance-broker2.tf    # Broker 2 configuration
│   │   ├── 📄 instance-broker3.tf    # Broker 3 configuration
│   │   ├── 📄 deploy-kafka-brokers.tf # Deployment script for all brokers
│   ├── 📂 variables           # Centralized Terraform variables
│   │   ├── 📄 variables.tf
│   ├── 📂 outputs             # Terraform output handling (optional)
│   │   ├── 📄 outputs.tf
├── 📂 monitoring              # Observability & alerting
│   ├── 📄 prometheus-config.yml
│   ├── 📄 grafana-dashboard.json
├── 📂 scripts                 # Utility scripts
│   ├── 📄 benchmark-tests.py
│   ├── 📄 health-check.sh
├── 📂 .github/workflows       # CI/CD pipelines
│   ├── 📄 ci-cd-pipeline.yml  # Main CI/CD pipeline for Terraform deployment
│   ├── 📄 ci-google-auth.yml  # Google Cloud authentication workflow
├── 📄 .gitignore              # Ignore unnecessary files
├── 📄 .pre-commit-config.yaml # Code quality hooks
├── 📄 requirements.txt        # Python dependencies for GCP & Terraform
├── 📄 README.md               # Repository overview
├── 📄 ProjectDirectory.md      # This document (directory structure)

```