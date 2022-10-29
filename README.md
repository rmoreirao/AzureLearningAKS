# AzureLearningAKS

Original Github: https://github.com/aspnetrun/run-devops
Original Course: https://www.udemy.com/course/deploying-net-microservices-with-k8s-aks-and-azure-devops/learn/
Blog posts: https://medium.com/aspnetrun/deploying-net-microservices-to-azure-kubernetes-services-aks-and-automating-with-azure-devops-c50bdd51b702

# Your user rights on AKS
### Grant the "Azure Kubernetes Service Cluster Admin Role" to your user so you can also administer the AKS from the Dashboard
# CI CD
### Setup CI CD User Rights
CI CD User in Azure needs Contributor and User Access Administrator roles
### Set the following Github Secrets:
- ACR_NAME: name of ACR
- ACR_URL: URL for the ACR
- CLIENT_ID: Client ID user connecting from Github to Azure
- CLIENT_SECRET: Secret to connect from Github to Azure
- LOCATION: Azure Location - ex.: westeurope
- LOCATION_SUFFIX: Azure Location Suffix - ex.: we
- SUBSCRIPTION_ID: Azure Subscription ID
- TENANT_ID: Azure Tenant ID
- MONGO_DB_USER: MongoDB user name
- MONGO_DB_USER_BASE64: MongoDB user name on Base 64 format
- MONGO_DB_PASS: MongoDB pass
- MONGO_DB_PASS_BASE64: MongoDB pass on base64 format
# Local Kubernetes
### To run k8s locally, check info on localk8s folder
# AKS
### To run AKS, deploy the iac and follow steps in the AKS folder

# Docker Compose
### For Docker Compose see instructions under the Shopping folder