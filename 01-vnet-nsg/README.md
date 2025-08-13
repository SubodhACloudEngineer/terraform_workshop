# Task 1 – VNet + Subnet + NSG

## What this automates
Creates a Resource Group, VNet (10.10.0.0/16), Subnet (10.10.1.0/24), NSG with inbound SSH/HTTP, and associates the NSG with the subnet.

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
