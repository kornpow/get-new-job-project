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
```

```
kubectl create secret generic lnbits-env --from-file=lnbits/secrets/env-example
```


# Resources
- git clone https://github.com/askblaker/k3s.rocks.git