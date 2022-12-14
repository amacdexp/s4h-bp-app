# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).



## SSH

```
### Ensure SSH is enabled for the application you want to remote debug
### The easiest way to check is to execute
cf ssh s4h-bp-app-srv -i <instance_number>
### If this should fail enable SSH access with this command
cf enable-ssh s4h-bp-app-srv
### The changes do take effect after a complete restart of the application only hence this should be done during a maintenance window in productive landscapes
cf restart s4h-bp-app-srv
### IMPORTANT: If you had to enable SSH chances are this was done on purpose for security reasons hence when you are done debugging run
cf disable-ssh s4h-bp-app-srv

### Port forwarding sample usage:
cf ssh s4h-bp-app-srv  -T -c 'kill -USR1 $(pidof node)'
cf ssh -N -L 9229:127.0.0.1:9229 s4h-bp-app-srv
```

## Run and debug
```
launch.json:
    {
      "name": "attach to CF on port 9229",
      "port": 9229,
      "request": "attach",
      "type":"node",
      "localRoot": "${workspaceFolder}",
      "remoteRoot": "/home/vcp/app"
    }

Debug console: 
cds.version
process.ppid
process.env.

```

## Activate API_BUSINESS_PARTNER API on-premise S/4


https://help.sap.com/docs/EXCISE_TAX/14d4836ce4ae4a2cb12de79dc593a87d/d7fba360fd7b439a80949e22a89632a8.html?locale=en-US&q=activate%20api_business_partner

```

/n/iwfnd/maint_service
```

![Alt text](/screengrabs/S4H_ADD_SERVICE.png?raw=true "CAL S4H demo on-pmreise system, expose/add the API_BUSINESS_PARTNER service")


## Destination example config

NOTE: Cloud Connector needed exposing on-premise to a BTP Subaccount.

![Alt text](/screengrabs/SCC_onpremise.png?raw=true "CAL S4H demo system, exposted on HTTP port, to avoid SSL/Cert issues")

![Alt text](/screengrabs/BTP_SUBACCOUNT_DEST.png?raw=true "Example Destination 'calS4H'  setup on subaccount")

```
e.g.
Name: calS4H
Description: calS4H
URL: http://cals4h:443/
Type: HTTP
ProxyType: OnPremise
LocationID: loc1
Authentication: BasicAuthentication
HTML5.DynamicDestination: true
sap-client: 100
WebIDEEnabled: true
WebIDEUsage: odata_abap,dev_abap


NOTE: As the demo S4H system generated by CAL doesn't have fully configured SSL certificates, the  HTTP port 50000  was used to by-pass SSL/verification issues, when access remotely from BTP.

```



## [Optional] Set up HYBRID testing
```
cf create-service-key s4h-bp-app-uaa s4h-bp-app-uaa-key;
cf create-service-key s4h-bp-app-destination s4h-bp-app-destination-key;
cds bind -2 s4h-bp-app-uaa,s4h-bp-app-destination,s4h-bp-app-connectivity

cds watch --profile hybrid
```

## Test Results on BAS Hybrid and  CF

![Alt text](/screengrabs/BAS_CDS_HYBRID.png?raw=true "'cds watch --profile hybrid'     output for reference")

![Alt text](/screengrabs/BAS_HYBRID_LOCAL_OUTPUT.png?raw=true "Hybrid localhost 4004 output")

![Alt text](/screengrabs/BTP_CF_APPROUTER_APP.png?raw=true "Access Via the CF Approuter application... requires authentication")

![Alt text](/screengrabs/BTP_CF_APPROUTER_SUPPLIERS.png?raw=true "CF Approuter App can display list of on-premise S4H SUPPLIERS")


## Learn More


Learn??more??at??https://cap.cloud.sap/docs/get-started/.
