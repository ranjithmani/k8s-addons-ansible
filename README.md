# Kubernetes Addons Ansible Playbooks

This repository contains Ansible playbooks for deploying various Kubernetes addons and monitoring tools. These playbooks help automate the deployment of essential components for a production-ready Kubernetes cluster.

## Components

The repository includes playbooks for the following components:

- **Metrics Server**: Kubernetes metrics collection and resource monitoring
- **Argo Workflows**: Workflow engine for orchestrating parallel jobs on Kubernetes
- **Loki**: Log aggregation system designed for Kubernetes
- **MetalLB**: Load balancer implementation for bare metal Kubernetes clusters
- **Prometheus**: Monitoring and alerting toolkit

## Prerequisites

- Ansible 2.9 or higher
- Kubernetes cluster with kubectl configured
- Helm 3.x (for some deployments)
- Sufficient cluster resources for the addons

## Repository Structure

```
k8s-addons-ansible/
├── main.yaml                 # Main playbook that includes all deployments
├── metrics-server.yaml       # Metrics Server deployment
├── deploy-argo.yaml         # Argo Workflows deployment
├── deploy-loki.yaml         # Loki deployment
├── deploy-metallb.yaml      # MetalLB deployment
├── deploy-promethues.yaml   # Prometheus deployment
└── loki-custom-values.yaml  # Custom configuration for Loki
```

## Usage

### Deploying All Components

To deploy all components:

```bash
ansible-playbook main.yaml
```

### Deploying Specific Components

You can deploy specific components using tags:

```bash
# Deploy only monitoring components
ansible-playbook main.yaml --tags monitoring

# Deploy only Argo Workflows
ansible-playbook main.yaml --tags argo

# Deploy multiple specific components
ansible-playbook main.yaml --tags "prometheus,loki"
```

### Available Tags

The playbooks support the following tags:

- **Individual Components**:
  - `metrics-server`
  - `argo`
  - `loki`
  - `metallb`
  - `prometheus`

- **Functional Groups**:
  - `monitoring` (includes metrics-server, prometheus, loki)
  - `logging` (includes loki)
  - `networking` (includes metallb)
  - `cicd` (includes argo)
  - `workflows` (includes argo)
  - `loadbalancer` (includes metallb)
  - `metrics` (includes prometheus)

## Component Details

### Metrics Server
- Provides resource metrics for Kubernetes
- Essential for HPA (Horizontal Pod Autoscaling)
- Lightweight and efficient

### Argo Workflows
- Workflow engine for Kubernetes
- Supports DAG and step-based workflows
- Integrates with CI/CD pipelines

### Loki
- Log aggregation system
- Efficient storage and querying
- Integrates with Grafana

### MetalLB
- Load balancer for bare metal Kubernetes clusters
- Supports Layer 2 and BGP
- Provides external IP addresses for services

### Prometheus
- Monitoring and alerting system
- Time series database
- Powerful query language (PromQL)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues and feature requests, please create an issue in the repository.
