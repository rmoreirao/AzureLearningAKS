# Push image to acr container

az acr build --image shopping/shopping-web-app:latest  --registry acrshoppingrmoreiraowe --build-arg build_version=latest --file Dockerfile .