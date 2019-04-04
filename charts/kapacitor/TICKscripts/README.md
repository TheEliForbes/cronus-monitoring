
# TICK Scripts
Kapacitor uses a Domain Specific Language(DSL) named TICKscript to define tasks. In this project, it is used to send various alerts to a Slack channel. These alerts cover various things that may go wrong with the Kubernetes cluster. For example, if a node is showing an unhealthy status, an alert will be pushed to the Slack channel. This is done by monitoring data from Kube State Metrics as it is inserted into InfluxDB. If data is inserted into the database that causes the alert to trigger, you can expect a notification to be in Slack within 30 seconds to a minute after the event occurs. 
## Getting started
### Connect to the Kubernetes Pod
 1. First, clone this repository on the machine that hosts the master node of your Kubernetes cluster
 2. Run the setup for the monitoring project (see readme on the main page)
 3. Navigate to the scripts folder of the repository
 4. Run this command: `./connectToKapacitorContainer.sh`
 5. Once the script is done running, the terminal will be in the Kapacitor pod where you will be able to issue Kapacitor commands.
### Copy TICK Scripts into Kapacitor Pod
The Kapacitor pod is not able to access the local machine's file system. This means that to be able to use the TICK scripts, they will need to be copied into the pod. Luckily, we provide a script to do this. 

 1. Navigate to the scripts folder.
 2. Run this command: `./copyTickScripts.sh`
 3. Once the script is done running, the whole TICKScripts folder (this folder) will be present in the Kapacitor pod.
### Deploying a Script
Once the scripts have been copied to the pod, we can now deploy them as Kapacitor tasks. This will take a couple of steps.
1. First, connect to the Kapacitor pod and navigate to the directory where the scripts reside.
2. Pick a tick script to deploy
3. Run this command: `kapacitor define <taskName> -tick <scriptName>.tick`
4. Example: `kapacitor define cpu_alert -tick cpu_alert.tick`
5. To see if the task has been defined successfully, run this command: `kapacitor list tasks`
6. When the task is defined, it will default to being disabled.
7. Run this command: `kapacitor enable <taskName>`

## Writing Scripts
In this project, we utilized the functionality of Kapacitor and TICK scripts to monitor the data flowing through InfluxDB. The main purpose being to identify if an event has happened in the Kubernetes cluster that warents a notification be sent to the adminstrator or team that is responsible for the cluster. This was mainly achived by writing stream scripts, but a batch script was also implemented. These alerts are configured to send messages to a slack channel that is configured in the kapacitor set up.