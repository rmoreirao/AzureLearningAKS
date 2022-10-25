# MongoDB
Check that on docker hub: https://hub.docker.com/_/mongo/
### get docker image for MongoDB
docker pull mongo

### run mongo db docker image
docker run -d -p 27017:27017 --name shopping-mongo mongo

### log to docker container
docker exec -it shopping-mongo /bin/bash

### Start mongo cli
mongosh

### Check DBs
show db

### Create new DB

use CatalogDb

db.createCollection('Products')

 db.Products.insertMany([{'Name':'Compaq Presario','Category':'Computers','Summary':'Old and dirty PC','Description':'None','Price':'999.99'}])

### check data
db.Products.find({}).pretty()

# Push image to acr container

az acr build --image shopping/shopping-api:latest  --registry acrshoppingrmoreiraowe --build-arg build_version=latest --file .\Shopping.API\Dockerfile .