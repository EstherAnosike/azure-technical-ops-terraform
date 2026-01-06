# Azure Technical Ops Terraform Portfolio

This repository demonstrates Azure infrastructure automation using Terraform with:

- Multi-environment setup (`dev`, `test`)
- Reusable modules: Resource Group, Network, Storage
- Azure CLI authentication
- GitHub Actions CI/CD workflow

## Structure

azure-technical-ops-terraform/
├── README.md
|__ .gitignore
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── terraform.tfvars
│   │   └── outputs.tf
│   └── test/
│       ├── main.tf
│       ├── providers.tf
│       ├── terraform.tfvars
│       └── outputs.tf
├── modules/
│   ├── resource-group/
│   │   └── main.tf
│   ├── network/
│   │   └── main.tf
│   └── storage/
│       └── main.tf
└── .github/
    └── workflows/
        └── terraform-ci.yml

## Quick Start

1. Login to Azure CLI:

```bash
az login
az account set --subscription "<subscription-id>"
```

2. Initialize Terraform

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

Notes;

- Each environment has separate state and outputs

- Modules are generic and reusable

- All module variables and outputs are merged inside main.tf

- Terraform variables are defined in terraform.tfvars per environment to avoid prompts

- CI/CD ready
