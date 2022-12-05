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


### Run and debug
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

## Learn More


Learn more at https://cap.cloud.sap/docs/get-started/.
