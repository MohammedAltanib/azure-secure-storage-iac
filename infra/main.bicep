targetScope = 'resourceGroup'

param location string = resourceGroup().location
param env string = 'dev'

var tags = {
  project: 'azure-secure-storage-iac'
  environment: env
  owner: 'MohammedAltanib'
}

var storageAccountName = 'st${uniqueString(resourceGroup().id)}'

module storage 'modules/storage.bicep' = {
  name: 'storage'
  params: {
    location: location
    storageAccountName: storageAccountName
    tags: tags
  }
}

output storageAccountName string = storage.outputs.storageAccountName
