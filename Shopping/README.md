# Push image to acr container - run from the Shopping folder
### Login to Azure
az login
### Build and push the image to ACR
az acr build --image shopping/shopping-web-app:latest  --registry acrshoppingrmoreiraowe --build-arg build_version=latest --file Shopping.Client/Dockerfile .