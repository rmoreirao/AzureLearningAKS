// 
/*
1) Command Line to execute bicep file: 
az group create --name rg-shoppingwebapprmoreirao-prod-we --location westeurope

2) Command Line to load bicep file - use  Bash
az deployment group create \
  --name DeployShoppingInfra \
  --resource-group rg-shoppingwebapprmoreirao-prod-we \
  --template-file main.bicep \
  --parameters location_suffix=we

*/

param location string = resourceGroup().location
param location_suffix string = 'we'
// For simplicity, we receive the env name as a parameter and we do not apply any special sizing with it
// Ideally Prod would be more powerful than Dev, so a parameters file would be a better solution
param environment string = 'prod'

// var webAppName = 'shoppingwebapprmoreirao${environment}${location_suffix}'
var acrName = 'acrshoppingrmoreirao${location_suffix}'
// var webAppLinuxFxVersion = 'DOCKER|${acrName}.azurecr.io/shopping/shoppingwebapp:latest'
// var appServicePlanName_var = 'asp-shoppingwebapprmoreirao-${environment}-${location_suffix}'
// var appInsightName = 'appi-shoppingwebapprmoreirao-${environment}-${location_suffix}'

// azure container registry
resource acr 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: acrName
  location: location
  tags: {
    displayName: 'Container Registry'
    'container.registry': acrName
  }
  sku: {
    name: 'Basic'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    adminUserEnabled: true
  }
}

// resource appServicePlanName 'Microsoft.Web/serverfarms@2022-03-01' = {
//   name: appServicePlanName_var
//   location: location
//   sku: {
//     name: 'B1'
//     tier: 'Basic'
//     size: 'B1'
//     family: 'B'
//     capacity: 1
//   }
//   kind: 'linux'
//   properties: {
//     maximumElasticWorkerCount: 1
//     isSpot: false
//     targetWorkerCount: 0
//     targetWorkerSizeId: 0
//     zoneRedundant: false
//     reserved:true
//   }
// }

// resource webApp 'Microsoft.Web/sites@2022-03-01' = {
//   name: webAppName
//   location: location
//   kind: 'app,linux,container'
//   identity: {
//     type: 'SystemAssigned'
//   }
//   dependsOn: [
//     appInsights
//   ]
//   properties: {
//     enabled: true
    
//     serverFarmId: appServicePlanName.id
//     reserved:true
//     siteConfig: {
//       numberOfWorkers: 1
//       acrUseManagedIdentityCreds: false
//       alwaysOn: true
//       http20Enabled: false
//       functionAppScaleLimit: 0
//       minimumElasticInstanceCount: 0
//       linuxFxVersion: webAppLinuxFxVersion
//     }
//     clientCertEnabled: false
//     clientCertMode: 'Required'
//     hostNamesDisabled: false
//     httpsOnly: true
//     redundancyMode: 'None'
//     storageAccountRequired: false
//     keyVaultReferenceIdentity: 'SystemAssigned'
//   }
// }



// resource webAppName_web 'Microsoft.Web/sites/config@2022-03-01' = {
//   parent: webApp
//   name: 'web'
//   location: location
//   properties: {
//     numberOfWorkers: 1
//     netFrameworkVersion: 'v4.0'
//     linuxFxVersion:webAppLinuxFxVersion
//     httpLoggingEnabled: false
//     acrUseManagedIdentityCreds: false
//     detailedErrorLoggingEnabled: false
//     use32BitWorkerProcess: true
//     alwaysOn: true
//     managedPipelineMode: 'Integrated'
//     autoHealEnabled: false
//     vnetRouteAllEnabled: false
//     vnetPrivatePortsCount: 0
//     ipSecurityRestrictions: [
//       {
//         ipAddress: 'Any'
//         action: 'Allow'
//         priority: 1
//         name: 'Allow all'
//         description: 'Allow all access'
//       }
//     ]
//     scmIpSecurityRestrictions: [
//       {
//         ipAddress: 'Any'
//         action: 'Allow'
//         priority: 1
//         name: 'Allow all'
//         description: 'Allow all access'
//       }
//     ]
//     minTlsVersion: '1.2'
//     scmMinTlsVersion: '1.2'
//     ftpsState: 'FtpsOnly'
//     azureStorageAccounts: {
//     }
//   }
// }



// resource appServiceLogging 'Microsoft.Web/sites/config@2020-06-01' = {
//   parent: webApp
//   name: 'appsettings'
//   properties: {
//     APPINSIGHTS_INSTRUMENTATIONKEY: appInsights.properties.InstrumentationKey
//     APPLICATIONINSIGHTS_CONNECTION_STRING: appInsights.properties.ConnectionString
//     // ConnectionString: listConnectionStrings(cosmosDbName.id, '2019-12-12').connectionStrings[0].connectionString
//     ApplicationInsightsAgent_EXTENSION_VERSION: '~2'
//     XDT_MicrosoftApplicationInsights_Mode: 'default'
//     WEBSITES_ENABLE_APP_SERVICE_STORAGE: 'false'
//     DOCKER_REGISTRY_SERVER_URL: reference(acr.id, '2019-05-01').loginServer
//     DOCKER_REGISTRY_SERVER_USERNAME: listCredentials(acr.id, '2019-05-01').username
//     DOCKER_REGISTRY_SERVER_PASSWORD: listCredentials(acr.id, '2019-05-01').passwords[0].value
//   }
// }

// resource appServiceAppSettings 'Microsoft.Web/sites/config@2020-06-01' = {
//   parent: webApp
//   name: 'logs'
//   properties: {
//     applicationLogs: {
//       fileSystem: {
//         level: 'Warning'
//       }
//     }
//     httpLogs: {
//       fileSystem: {
//         retentionInMb: 40
//         enabled: true
//       }
//     }
//     failedRequestsTracing: {
//       enabled: true
//     }
//     detailedErrorMessages: {
//       enabled: true
//     }
//   }
// }

// resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
//   name: appInsightName
//   location: location 
//   kind: 'web'
//   properties: {
//     Application_Type: 'web'
//     Request_Source: 'rest'
//   }
// }

module aks './aks.bicep' = {
  name: 'aksDeployment'
  params: {
    location: location
    environment: environment
    location_suffix: location_suffix 
    acrName: acr.name
  }
  scope: resourceGroup()
}

output acrLoginServer string = acr.properties.loginServer
// output webAppName string = webAppName
// output appServicePlanName string = appServicePlanName_var
