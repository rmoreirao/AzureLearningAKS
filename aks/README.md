### install AKS cli:
az aks install-cli

### Configure AKS in your local kubernets
az aks get-credentials --resource-group rg-shoppingwebapprmoreirao-prod-we --name aks-shoppingrmoreirao-prod-we

### From now on, all commends will be executed on AKS
kubectl get all

### Load all yaml into AKS
### From previous folder
kubectl apply -f .\aks\

### check external IP and access to use the App
kubectl get service
