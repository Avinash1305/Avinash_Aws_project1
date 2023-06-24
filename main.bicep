param pappserviceplan1name string
param pmy_appservice1name string
param plocation string = resourceGroup().location
param pappinsightname string
param paz_devops_sqlserver1 string
param padminsqlserver string
@secure()
param ppasswordsqlserver string

module web_module 'Module/web.bicep'={
  name: 'web_module'
  params:{
    pappserviceplan1name: pappserviceplan1name
    pmy_appservice1name: pmy_appservice1name
    plocation: plocation
    pinstrumentationkey:ai_module.outputs.oInstrumentationkey
  }
  }
module sql_module 'Module/sql.bicep'={
  name: 'sql_module'
  params:{
    padminsqlserver: padminsqlserver
    paz_devops_sqlserver1: paz_devops_sqlserver1
    ppasswordsqlserver: ppasswordsqlserver
    plocation: plocation
  }
}
module ai_module 'Module/appinsight.bicep'={
  name: 'ai_module' 
  params: {
    pappinsightname: pappinsightname
    plocation: plocation
  }
  }
