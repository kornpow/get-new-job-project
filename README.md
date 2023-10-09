# get-new-job-project


## Kubernetes

### Install application into cluster
```bash
    kubectl apply -f app.yaml
```

### Create config secrets
```
kubectl create configmap nginx-config --from-file=nginx.conf
```

```
kubectl delete configmap resume-markdown
kubectl create configmap resume-markdown --from-file=RESUME.md
```


# Resources
- git clone https://github.com/askblaker/k3s.rocks.git