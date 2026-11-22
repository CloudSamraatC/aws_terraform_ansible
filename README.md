# Production AWS Infrastructure with Terraform & Ansible

End-to-end Infrastructure-as-Code (IaC) and Configuration Management project provisioning a custom AWS VPC network and EC2 instance with **Terraform**, followed by automated SSH server configuration with **Ansible**.

## Architecture
- **Networking (`terraform/`):** Provisions a dedicated VPC (`10.20.0.0/16`), public subnet (`10.20.1.0/24`), Internet Gateway, public route table, and a least-privilege Security Group (restricting SSH port 22 to `admin_cidr` and allowing HTTP port 80).
- **Compute (`terraform/`):** Launches an Ubuntu 24.04 EC2 instance (`t3.micro`) with an encrypted `gp3` root volume.
- **Configuration Management (`ansible/`):** Connects over SSH using key-pair authentication (`become: true`), updates `apt` cache, installs Nginx, deploys a custom HTML template, and ensures the service is started and enabled.

## Usage
1. **Provision Infrastructure:**
   ```bash
   cd terraform
   cp terraform.tfvars.example terraform.tfvars
   terraform init && terraform apply
   ```
2. **Configure Web Server:**
   ```bash
   cd ../ansible
   # Update inventory.ini with instance_public_ip
   ansible web -m ping
   ansible-playbook site.yml
   ```
