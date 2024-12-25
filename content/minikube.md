---
title: Minikube & K8s basics
draft: false
tags:
  - K8s
  - Minikube
  - containers
  - orchestrators
  - term
---

# Minikube

A lot of starter stuff here follows from starter Go+Docker stuff at [[docker | Docker basics]].

## Deploying a Go helowoorld on Minikube

First off, ensure you have Docker installed and Docker group set up. It errors in "no docker group" silly-mode and refuses to get sudo'd (good).

```sh
minikube start
kubectl run demo --image=cloudnatived/demo:hello --port=9999 --labels app=demo
kubectl port-forward pods/demo 9999:8888
kubectl get pods --selector app=demo
```

![Terminal output of the middle 2 commands above.](./img/k8s-go-demo.png)
The error above also portrays how to deal with some silly little name errors - just **read**.
