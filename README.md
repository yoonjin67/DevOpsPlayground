
# Kubernetes Setup and DevOps Practices

This project showcases a set of practical scripts, tools, and configurations aimed at setting up and managing a Kubernetes (K8s) environment with associated DevOps technologies.
Basically, this project depends on Helm Charts. Although Some parts are deployed via Menifests, huge service like GitLab is deployed via Helm Upgrade.

---

## 📂 Project Structure

### Kubernetes
- **ansible/**: Contains Ansible playbooks and inventory for setting up and managing Kubernetes clusters, along with related configurations for Vault and other dependencies.
- **basic_setup/**: A collection of bash scripts for setting up the Kubernetes control plane, installing core tools (Cilium, Helm), and managing nodes and taints.
- **modify_cilium_policy/**: Contains Kubernetes YAML files for modifying Cilium policies, such as exporting ports from the Cilium network.
- **jenkins/**: Contains Jenkins Installation script via Helm
- **prometheus_and_grafana/**: Includes scripts for installing and setting up Prometheus and Grafana for Kubernetes monitoring.
- **utils/**: Utility scripts for setting up the environment and managing Kubernetes-related tasks.
- **metallb/**: Basic setup for metallb
- **gitlab/**: Contains GitLab installation script via helm
- **letsencrypt/**: Contains LetsEncrypt installation
- **kroki/**: Contains Kroki visualizer for Markdown
#### Known Errors
*Ansible initialized k8s cluster is unstable. There would be some permissions problem while making initial profiles; any pull requests are welcomed.*
#### Shortcuts
```bash
#!/bin/bash
export K8S_PLAYGROUND="$HOME/DevOpsPlayground/Kubernetes"
export ANSIBLE_PLAYGROUND="$K8S_PLAYGROUND/ansible"
export BASIC_SETUP="$K8S_PLAYGROUND/basic_setup"
export PROMETHEUS_PLAYGROUND="$K8S_PLAYGROUND/prometheus_and_grafana"
export INVENTORY="$ANSIBLE_PLAYGROUND/inventory"

# Usage: SCRIPTS $K8S_PLAYGROUND/basic_init
SCRIPTS() {
        local path="$1"
        local folder=$(dirname "$path")
        echo "$folder/scripts"
}

# Usage: ASSETS $K8S_PLAYGROUND/basic_init
ASSETS() {
        local folder="$1"
        echo "$folder/assets"
}

# Usage: YAML $K8S_PLAYGROUND/basic_init
YAML() {
        local folder="$1"
        local assets_path=$(ASSETS "$folder")
        echo "$assets_path/yaml"
}
```
This has shortcuts at utils/basic\_env.sh.
You can manage your folder with consistent grammar via this shortcuts.

##### e.g, if you want to add new environment variable
```bash
export GITLAB_PLAYGROUND="$K8S_PLAYGROUND/gitlab"
```


#### Directory Structure
```bash
.
├── ansible
│   ├── README
│   ├── TODO
│   ├── assets
│   │   └── yaml
│   │       ├── install_cilium.yaml
│   │       ├── install_deps.yaml
│   │       ├── setup_clusters.yaml
│   │       ├── setup_control_plane.yaml
│   │       ├── setup_workers.yaml
│   │       └── vault.yaml
│   ├── inventory
│   │   └── kube_inventory
│   └── scripts
│       └── init_k8s_with_ansible.sh
├── basic_setup
│   └── scripts
│       ├── init.sh
│       ├── init_control_plane.sh
│       ├── install_cilium.sh
│       ├── install_helm.sh
│       └── print_join_command.sh
├── gitlab
│   ├── assets
│   │   └── yaml
│   │       ├── letsencrypt
│   │       │   ├── certificate.yaml
│   │       │   └── clusterissuer.yaml
│   │       ├── runner.yaml
│   │       └── values.yaml
│   └── scripts
│       ├── README.md
│       ├── get_pw.sh
│       ├── gitlab_reinstall_with_runner.sh
│       ├── install_gitlab.sh
│       ├── install_runner.sh
│       └── setup_env.sh
├── jenkins
│   ├── assets
│   │   └── yaml
│   │       └── values.yaml
│   └── scripts
│       ├── get_pw.sh
│       └── install_jenkins.sh
├── kroki
│   ├── assets
│   │   └── yaml
│   │       ├── cluster-issuer.yaml
│   │       └── values.yaml
│   └── scripts
│       └── install_kroki.sh
├── kube_ops_view
│   └── scripts
│       └── install_kube_ops_view.sh
├── letsencrypt
│   └── scripts
│       └── install.sh
├── loki
│   └── assets
│       └── yaml
│           ├── grafana-configmap.yaml
│           ├── loki-grafana.yaml
│           ├── loki.yaml
│           ├── persistence
│           │   ├── pv.yaml
│           │   ├── pvc.yaml
│           │   └── storageclass.yaml
│           └── schemaconfig.yaml
├── metallb
│   ├── scripts
│   │   └── metallb_setup.sh
│   └── yaml
│       └── pools
│           ├── metallb_ip_pool.yaml
│           └── metallb_l2_advertisement.yaml
├── modify_cilium_policy
│   └── basic_port_export
│       └── assets
│           └── yaml
│               ├── export_port_from_cilium.yaml
│               └── loki_ingress.yaml
├── nfs_setup
│   └── scripts
│       ├── setup-master-helm.sh
│       └── setup.sh
├── prometheus_and_grafana
│   └── scripts
│       ├── add_incus_monitor.sh
│       ├── add_secret.sh
│       ├── get_pw.sh
│       └── install_prometheus.sh
├── tolerate_pod_allocation
│   ├── README.md
│   └── scripts
│       └── untaint.sh
└── utils
    └── basic_env.sh

44 directories, 54 files

```
#### 🗨️ Total Code Lines

```bash
      56 text files.
      52 unique files.
       5 files ignored.

github.com/AlDanial/cloc v 1.98  T=0.02 s (2577.6 files/s, 335580.0 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
YAML                            24            220           2289           3649
Markdown                         3             48              0            260
Bourne Shell                    25             38             23            243
-------------------------------------------------------------------------------
SUM:                            52            306           2312           4152
-------------------------------------------------------------------------------

```



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
- **GitLab Configuration**: Setting up GitLab with persistent storage and proper configuration for large-scale deployments.
- **Cilium Port Export**: Finalizing the Cilium policy export for security and networking.
### Ongoing
- **Full CI/CD Pipeline**: Still in the process of integrating CI/CD for automatic build and deployment.

---

## 📝 Future Improvements

- Completion of Cilium export logic to allow more refined Kubernetes networking and security configurations.

---

## 🧑‍💻 Contributing

Feel free to submit a pull request if you'd like to contribute to this project, or if you encounter any bugs or issues.

---

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

### Notes:
- For the most part, the setup should work for Kubernetes on Linux-based systems but may need adjustments for different environments or specific use cases.

