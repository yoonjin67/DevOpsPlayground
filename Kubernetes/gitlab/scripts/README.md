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
You should change your secrets section of gitlab webserver.
```yaml
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
```

This should be setted up.

Also, see setup\_letsencrypt.sh.
```bash
#!/bin/bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
kubectl apply -f $(YAML $GITLAB_PLAYGROUND)/letsencrypt
kubectl annotate ingress gitlab-webservice-default -n gitlab cert-manager.io/cluster-issuer="letsencrypt-prod" nginx.ingress.kubernetes.io/ssl-redirect="false" --overwrite
kubectl annotate ingress gitlab-minio -n gitlab cert-manager.io/cluster-issuer="letsencrypt-prod" nginx.ingress.kubernetes.io/ssl-redirect="false" --overwrite
kubectl annotate ingress gitlab-kas -n gitlab cert-manager.io/cluster-issuer="letsencrypt-prod" nginx.ingress.kubernetes.io/ssl-redirect="false" --overwrite
kubectl annotate ingress gitlab-registry -n gitlab cert-manager.io/cluster-issuer="letsencrypt-prod" nginx.ingress.kubernetes.io/ssl-redirect="false" --overwrite
```

Each ingresses you want to certify with LetsEncrypt provider should be annotated.
Also, be sure to port-forward each LetsEncrypt services' ports into 80.
```
First LetsEncrypt Service <- 80
Fist Certs created
Second LetsEncrypt Service <- 80
Second Certs Created
```

This is detailed diagram:

```plantuml
@startuml
autonumber

actor "Your Server / ACME Client\n(e.g., Certbot)" as ACMEClient
actor "Let's Encrypt CA\n(Certificate Authority)" as LE_CA
actor "Let's Encrypt Validator" as LE_Validator
participant "Your Web Server\n(Port 80)" as WebServer80

title Let's Encrypt HTTP-01 Validation Process Sequence

== Certificate Order ==
ACMEClient -> LE_CA : 1. Request Certificate for yourdomain.com
LE_CA --> ACMEClient : 2. Respond with Challenge (HTTP-01)
note right of LE_CA
  Challenge specifies:
  - Token (random string)
  - URL (where to place the token)
end note

== Perform HTTP-01 Challenge ==
ACMEClient -> WebServer80 : 3. Place Challenge File\n(/.well-known/acme-challenge/<token>)
note left of ACMEClient
  ACME Client writes a file to:
  /.well-known/acme-challenge/<token>
  This file contains:
  <token>.<key-authorization>
end note

ACMEClient -> LE_CA : 4. Tell CA Challenge is ready

LE_CA -> LE_Validator : 5. Request validation of yourdomain.com

LE_Validator -> WebServer80 : 6. HTTP GET\n/.well-known/acme-challenge/<token>
WebServer80 --> LE_Validator : 7. Return expected token.key-authorization

alt Validation succeeds
    LE_Validator --> LE_CA : 8. Validation successful!
    LE_CA --> ACMEClient : 9. Finalize Order & Provide Certificate (CSR fulfilled)
    ACMEClient -> ACMEClient : 10. Install Certificate (yourdomain.com.pem)
else Validation fails
    LE_Validator --> LE_CA : 8'. Validation failed.
    LE_CA --> ACMEClient : 9'. Notify challenge failed.
    ACMEClient -> ACMEClient : Retry or Abort
end alt

@enduml

```

