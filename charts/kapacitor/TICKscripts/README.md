# TICK Scripts
Kapacitor uses a Domain Specific Language(DSL) named TICKscript to define tasks. In this project, it is used to send variaous alerts to a slack channel. These alerts cover various things that may go wrong with the kubernetes cluster. For example if a node is showing an unhealthy status, an alert will be pushed to the slack channel. This is done by monitoring data from Kube State Metrics as it is inserted into InflixDB. If data is inserted into the database that causes the alert to trigger, you can expect a notification to be in slack within 30 seconds to a minute after the event occurs. 
## Getting started
### Connect to the kubernetes pod

 1. First, clone this repository on the machine that hosts the master node of your kubernetes cluster
 2. Run the set up for the monitroing project (see readme on the main page)
 3. If you are not already there, navigate to the scripts folder of the repository
 4. Run this command: `./connectToKapacitorContainer.sh`
 5. 