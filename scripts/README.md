# Scripts

This is a collection of scripts that may come in handy when developing or using the stack.



## General

### init.sh

This is your 'Swiss-Army-Script', it will handle all installation and configuration that is programatically possible, you're welcome.


### create.sh

This creates the stack from the given Helm Charts, and assumes that you have the needed 'setup' completed.


### destroy.sh

This tears down the stack, if you ever need to do that due to extenuating circumstances.


### upgrade.sh

`./upgrade.sh`

This is used for upgrading an existing stack when repo updates happen.


### installHelm.sh

`./installHelm.sh`

As the name implies, this installs Helm.


### dockerKube.bash

`./dockerKube.bash`

This was used for automatic installation of a good Docker/Kubernetes base, and is left here since it makes the stack work for *our* developers.


### reClone.sh

`./reClone.sh`

This is essentially an elaborate git pull.


### namespacedCreate.sh

*This is currently broken, please don't use it.*



## InfluxDB / Grafana

### query.sh
`./query.sh [-d|--databases] [-c|--cpu] [-k|--ksm] ["select+*+from+telegraf.."]`

`-d|--databases )` Shows the databases that currently exist in Influx.

`-c|--cpu )` Shows all data from the `cpu` table using `select+*+from+telegraf..cpu`.

`-k|--ksm )` Shows all data from the `kube_pod_container_status_restarts_total` table using a query similar to that used for `cpu`.

`"select+some+query+string"` Shows data depending on the inputted IFQL query.

This will query the Influx database for all given options, predefined or otherwise.


### echoGrafanaIP.sh

`./echoGrafanaIP.sh [-s|--start]`

This will display the current IP of the Grafana service. Optional `-s|--start` flag to start Grafana using Firefox.

### generateDashboards.sh

`./generateDashboards.sh`

This dynamically generates and imports various dashboards for each node in your Kubernetes cluster.



## Kapacitor

### connectToKapacitorContainer.sh
`./connectToKapacitorContainer.sh`

This will exec you into the Kapacitor pod, to allow for manual Kapacitor configuration.


### copyTickScripts.sh

`./copyTickScripts.sh`

This will copy the various TICKscripts from their folder in the Kapacitor chart, into the pod.


### defineTickTasks.sh

`./defineTickTasks.sh`

This is 'used' in tandem with `copyTickScripts.sh`, but the script generally fails. Manually running the commands within works though(?).


### tailKapacitorLogs.sh

`./tailKapacitorLogs.sh`

This will watch the Kapacitor logs for updates.


### deprecatedTikInstall.bash

`./deprecatedTikInstall.bash`

This is the old way of doing it, and is left as a potential exercise for the *daring* user.



## Kube-State-Metrics

### curl.sh

`./curl.sh`

This queries the Kube-State-Metrics Prometheus endpoint and displays it's data.



## Testing

### helmTest.sh

`./helmTest.sh`

Run native Helm Tests and Helm Unit Tests.

### testTick.sh

`./testTick.sh`

Run Kapacitor-Unit Tests.


### cleanUpTest.sh

`./cleanUpTest.sh`

Clean up Helm Test pods.


### initJenkins.sh

`./initJenkins.sh`


### setupJenkinsContainerSsh.sh

`./setupJenkinsContainerSsh.sh`
