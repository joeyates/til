# Glossary

* API server - the API endpoint component
* cluster -
* pod - a "node" which can be a phyical or virtualized machine
* deployment -
* service -
* ingress -
* ingress pod -
* manifest - YAML file which describes resources for Kubernetes to manage (services, deployments)

containers run in pods placed on nodes

# headless

"headless" means a service which doesn't have a proxy in front of the pods.
This means that the IPs of the pods are publicly available.

The configuration to create a headless service is:

spec.ClusterIP: None

# TLS (SSL)

https://kubernetes.github.io/ingress-nginx/user-guide/tls/

# kubectl

List services:

```sh
$ kubectl get svc
```

Get info about ingress pod:

```sh
$ kubectl get ingress
```
