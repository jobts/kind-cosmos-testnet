# kind-cosmos-testnet
Terraform deployment  of Kind k8s cluster with cosmos testnet node. 

### Assignment:
- Automate the deployment of a local kubernetes cluster
- Automate the deployment of a testnet cosmos rpc node
- Automate the deployment of grafana and prometheus to view the resources used such as cpu / memory / disk space etc..

## Realization

You have to install these packages on your machine: 
- terraform
- docker
- kubectl

Commands to set up the cluster and deploy the applications:  

```
terraform init
terraform apply  -target kind_cluster.default
terraform apply
```
For other tasks in the k8s cluster you can use kubectl  
