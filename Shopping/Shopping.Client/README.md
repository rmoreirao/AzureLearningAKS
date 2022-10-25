# Push image to acr container
### run following command from "Shopping" folder

az acr build --image shopping/shopping-web-app:latest  --registry acrshoppingrmoreiraowe --build-arg build_version=latest --file .\Shopping.Client\Dockerfile .