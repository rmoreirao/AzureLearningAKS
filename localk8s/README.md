# Mongo DB
1) kubectl apply -f mongo-secret.yaml
2) kubectl apply -f mongo.yaml
3) kubectl get pods
4) kubectl apply -f mongo-configmap.yaml

# Shopping API
1) kubectl create secret docker-registry acr-pull \
    --docker-server=acrshoppingrmoreiraowe.azurecr.io \
    --docker-username=<service-principal-ID> \
    --docker-password=<service-principal-password>

    kubectl create secret docker-registry acr-pull \
    --docker-server=acrshoppingrmoreiraowe.azurecr.io \
    --docker-username=? \
    --docker-password=?

2) kubectl apply -f shoppingapi.yaml
3) kubectl get services 
4) http://localhost:31000/swagger/index.html
5) kubectl apply -f shoppingapi-configmap.yaml

# Shopping Client
1) kubectl apply -f shoppingclient.yaml