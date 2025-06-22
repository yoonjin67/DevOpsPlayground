# ✅ Install and Configure
## ⚒️ Setup Environment
Edit ./setup\_env.sh
and run:
```bash
source ./setup_env.sh
```
## ⚙️ Installation
```bash
source ./install_gitlab.sh
```
### ⚙️ Install Runner
```bash
source ./install_runner.sh
./setup_gitlab_admin.sh
```
## 🔒 Certs 
set Environment variable YOUR\_DOMAIN
## 🔍 Get Password
```bash
./get_pw.sh
```
`You should change your secrets section of gitlab webserver.

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: gitlab-webservice-default
  namespace: gitlab
  # ...
spec:
  # ... 
  tls:
  - hosts:
    - gitlab.yoonjin2.kr
    secretName: gitlab-yoonjin2-kr-tls # <--- 
  rules:
  # ...

`
like this
