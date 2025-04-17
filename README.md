
# Kubernetes Setup and DevOps Practices

This project showcases a set of practical scripts, tools, and configurations aimed at setting up and managing a Kubernetes (K8s) environment with associated DevOps technologies.

---

## 📂 Project Structure

### Kubernetes
- **ansible/**: Contains Ansible playbooks and inventory for setting up and managing Kubernetes clusters, along with related configurations for Vault and other dependencies.
- **basic_setup/**: A collection of bash scripts for setting up the Kubernetes control plane, installing core tools (Cilium, Helm), and managing nodes and taints.
- **modify_cilium_policy/**: Contains Kubernetes YAML files for modifying Cilium policies, such as exporting ports from the Cilium network.
- **prometheus_and_grafana/**: Includes scripts for installing and setting up Prometheus and Grafana for Kubernetes monitoring.
- **undone/**: In-progress features and scripts for installing and configuring GitLab, Redis, and Postgres, among others, which have not yet been fully completed.
- **utils/**: Utility scripts for setting up the environment and managing Kubernetes-related tasks.

---

## 🚀 DevOps Practices Implemented

This project demonstrates several key DevOps practices, including:

### 1. **Kubernetes Cluster Setup**
   - Automated setup of a Kubernetes control plane with Ansible, ensuring a consistent environment across clusters.
   - The playbook installs dependencies and configures the necessary control plane components.

### 2. **Infrastructure as Code (IaC)**
   - Ansible is used to define and deploy the Kubernetes cluster, ensuring a repeatable, version-controlled, and scalable infrastructure setup.
   - YAML files for setting up storage (e.g., persistent volume claims for GitLab, Prometheus, and Redis) allow quick deployments across multiple environments.

### 3. **Networking & Service Mesh**
   - Cilium is installed as a CNI plugin to manage Kubernetes networking and security policies.
   - A script for exporting ports from Cilium has been created, but the final integration is still in progress.
  
### 4. **Continuous Integration/Continuous Deployment (CI/CD)**
   - While not fully integrated, there are existing scripts that lay the foundation for CI/CD pipelines for deploying GitLab, Prometheus, and other services. This will help automate the building, testing, and deployment processes.
   - In-progress GitLab configuration and storage setup will eventually automate containerized CI/CD workflows.

### 5. **Prometheus and Grafana Monitoring Setup**
   - Setup scripts for installing Prometheus and Grafana, enabling real-time monitoring of Kubernetes clusters and applications.
   - Prometheus is configured to scrape metrics from the Kubernetes API, while Grafana will display them in user-friendly dashboards.

### 6. **Version Control & Dependency Management**
   - Ansible playbooks and shell scripts are kept in version control, ensuring reproducibility of the environment across multiple deployments.
   - External dependencies, such as Helm charts for Cilium and GitLab, are handled via YAML and managed through the cluster setup.

### 7. **Security and Secrets Management**
   - Vault integration for secrets management and secure access to sensitive data within the Kubernetes cluster.
   - Ongoing efforts to improve security, including custom configuration for both GitLab and Vault.

---

## 🛠 Technologies Practiced

- **Kubernetes**: Cluster orchestration, scaling, and management.
- **Ansible**: Infrastructure automation and deployment via YAML playbooks.
- **Cilium**: Advanced networking and security for Kubernetes.
- **Helm**: Package manager for Kubernetes applications.
- **Prometheus & Grafana**: Monitoring and observability stack.
- **GitLab**: CI/CD and version control system.
- **Vault**: Secrets management for Kubernetes and other sensitive data.
  
---

## 🏗 Progress and Future Work

### Completed:

- **Kubernetes Setup**: Control plane setup and node management scripts.
- **Cilium Networking Setup**: CNI plugin installation and port export policy.
- **Prometheus & Grafana**: Installation scripts for cluster monitoring.
- **Ansible Playbooks**: Defined and tested deployment scripts for cluster configuration.

### Ongoing:

- **GitLab Configuration**: Setting up GitLab with persistent storage and proper configuration for large-scale deployments.
- **Full CI/CD Pipeline**: Still in the process of integrating CI/CD for automatic build and deployment.
- **Cilium Port Export**: Finalizing the Cilium policy export for security and networking.

---

## 📝 Future Improvements

- Completion of the GitLab setup and integration into the CI/CD pipeline.
- Full automation of monitoring stack using Prometheus, Grafana, and custom alerts.
- Completion of Cilium export logic to allow more refined Kubernetes networking and security configurations.

---

## 🧑‍💻 Contributing

Feel free to submit a pull request if you'd like to contribute to this project, or if you encounter any bugs or issues.

---

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

### Notes:
- **Undone** folder: Contains the "undone" scripts and configurations that are not yet fully functional.
- For the most part, the setup should work for Kubernetes on Linux-based systems but may need adjustments for different environments or specific use cases.

