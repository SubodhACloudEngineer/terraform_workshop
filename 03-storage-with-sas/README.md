# Task 3 – Storage Account + Private Container + SAS

## What this automates
Creates a Storage Account with versioning and a lifecycle rule, a private Blob container, and outputs a time-limited SAS URL targeting the container (valid 7 days).

## How to use
1. Install Terraform and Azure CLI; login with `az login` and `az account set -s "<SUBSCRIPTION_ID>"`.
2. In this folder, run:
   ```bash
   terraform init
   terraform plan
   terraform apply -auto-approve
   ```
3. To destroy:
   ```bash
   terraform destroy -auto-approve
   ```

## Inputs & Outputs
See `variables.tf` and `outputs.tf` for tunables and produced values.

## Notes
- These samples use the default AzureRM provider auth (your Azure CLI session).
- Safe to run in a demo subscription. Resource names are randomized to avoid collisions.
