# Infrastructure Automation Stack

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![DigitalOcean](https://img.shields.io/badge/DigitalOcean-%230167ff.svg?style=for-the-badge&logo=digitalOcean&logoColor=white)

End-to-end infrastructure provisioning and configuration system with security-first defaults.

## Features

**Infrastructure Layer (Terraform)**
- DigitalOcean Droplet provisioning
- Cloudflare DNS management
- Azure remote state storage
- Firewall configuration with port validation
- Auto-generated Ansible inventory

**Configuration Layer (Ansible)**
- System hardening baseline
- Docker runtime installation
- Application deployment framework
- Tag-based execution workflow

## Architecture

```bash
.
├── ansible/
│   ├── playbook.yml        # Main configuration pipeline
│   ├── inventory.ini       # Terraform-generated targets
│   └── roles/
│       ├── essentials/     # Base system hardening
│       ├── docker/         # Container runtime setup
│       └── applications/   # Service deployment
├── terraform/
│   └── modules/           # Reusable cloud components
└── environments/
    └── prod/              # Production environment
        ├── compute.tf     # Server definitions
        └── dns.tf         # DNS records
```

## Quick Start

### 1. Provision Infrastructure
```bash
cd environments/prod/digitalocean
terraform init -backend-config="storage_account_name=selfhostingobifm"
terraform apply -var="do_token=$DO_TOKEN" -var="cloudflare_api_token=$CF_TOKEN"
```

### 2. Configure System
```bash
ansible-playbook -i ../../../ansible/inventory.ini ../../../ansible/playbook.yml
```

### 3. Targeted Updates
```bash
# Only update applications
ansible-playbook -i inventory.ini playbook.yml --tags apps,services

# Reconfigure Docker environment
ansible-playbook -i inventory.ini playbook.yml --tags docker,runtime
```

## Ansible Playbook Structure

### Playbook Workflow
```yaml
- Verify Connectivity       # Basic host reachability check
- System Hardening          # Security baseline configuration
- Container Runtime Setup   # Docker installation
- Deploy Applications       # Service deployment
```

### Execution Tags
| Tag | Description | 
|-----|-------------|
| `system` | OS hardening and base config |
| `essentials` | Critical security setup |
| `docker` | Container runtime installation |
| `runtime` | Docker environment config |
| `apps` | Application deployments |
| `services` | Service configuration |

## Security Features

**Infrastructure**
- Non-standard SSH port (23232)
- Port range enforcement (1024-49151)
- Isolated network policies
- Azure-backed remote state

**Configuration**
- Minimal privilege escalation
- Idempotent hardening tasks
- Containerized service isolation
- Audit-ready playbook structure

## Customization

**Ansible Variables**
```yaml
# ansible/roles/essentials/vars/main.yml
ssh_port: 23232
package_list:
  - fail2ban
  - unattended-upgrades
  - apt-transport-https
```

**Terraform Variables**
```hcl
# environments/prod/digitalocean/variables.tf
variable "do_server_size" {
  description = "Droplet instance size"
  default     = "s-2vcpu-4gb" # Change to scale resources
}

variable "subdomains" {
  description = "Cloudflare DNS entries"
  type        = set(string)
  default     = ["app", "monitor"] # Add required subdomains
}
```

## Destruction Protocol

1. Destroy applications:  
`ansible-playbook -i inventory.ini playbook.yml --tags apps,services -e "state=absent"`

2. Teardown infrastructure:  
`terraform destroy -var="do_token=$DO_TOKEN" -var="cloudflare_api_token=$CF_TOKEN"`

## License

[MIT License](LICENSE) - Fork, modify, and use freely. Attribution appreciated.
