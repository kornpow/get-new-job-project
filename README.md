# get-new-job-project


## Kubernetes

### Install application into cluster
```bash
    # install resume app
    cd kubernetes/resume
    helm upgrade --install resume .
```

```bash
    # install labelprinter app
    cd kubernetes/labelprinter
    helm upgrade --install labelprinter .
```

### Create config secrets
```
kubectl create configmap nginx-config --from-file=nginx.conf
```

```
kubectl delete configmap resume-markdown
kubectl create configmap resume-markdown --from-file=resume-app/RESUME.md

kubectl create configmap nginx-html --from-file=public/index.html
```

```
kubectl delete secret lnbits-env
kubectl create secret generic lnbits-env --from-file=lnbits/secrets/.env

kubectl delete secret lnd-creds
kubectl create secret generic lnd-creds \
    --from-file=/home/skorn/Documents/creds/kornpow-store/lnd/tls.cert \
    --from-file=/home/skorn/Documents/creds/kornpow-store/lnd/admin.macaroon
```

```
kubectl create secret generic postgres-creds \
    --from-literal=password=test123 \
    --from-literal=postgres-password=superadmin123
```

kubectl create secret generic pixel-promo-dotenv \
    --from-file=/Users/samkorn/Documents/repos/satoshis-ads/app/.env


# Resources
- git clone https://github.com/askblaker/k3s.rocks.git