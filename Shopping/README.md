# Code based on this course:
https://www.udemy.com/course/deploying-net-microservices-with-k8s-aks-and-azure-devops/
...

# Docker and Docker Compose
### Docker compose
docker-compose -f .\docker-compose.yml -f .\docker-compose.override.yml up -d


### Docker Stop All
docker container stop $(docker container ls -aq)
docker container prune -f


# Kubernets
### Commnads
https://kubernetes.io/docs/reference/kubectl/cheatsheet/
kubectl get all
kubectl cluster-info

### 