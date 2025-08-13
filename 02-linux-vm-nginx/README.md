# Task 2 – Linux VM with Nginx

## What this automates
Creates a Linux VM (Ubuntu 22.04) in its own VNet/Subnet with a Public IP and NSG rules for SSH/HTTP. Nginx is installed via cloud-init, and the VM's public IP and credentials are output.

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
