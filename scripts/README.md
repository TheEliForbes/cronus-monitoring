# Scripts

This is a collection of scripts that our developers have found useful when using the stack.



## General

### init.sh

`sudo ./init.sh`

This is your 'Swiss-Army-Script', it will handle all installation and configuration that is programatically possible, you're welcome.


### create.sh

`./create.sh`

Create the stack from the given Helm Charts, this assumes that you have the needed 'setup' completed.


### destroy.sh

`./destroy.sh`

Tear down the stack, if you ever need to do that due to extenuating circumstances.


### upgrade.sh

`./upgrade.sh`

Upgrade an existing stack when repo updates happen.


### installHelm.sh

`./installHelm.sh`

As the name implies, this installs Helm.


### dockerKube.bash

`./dockerKube.bash`

This was used for automatic installation of a good Docker/Kubernetes base, and is left here since it makes the stack work for *our* developers.


### reClone.sh

`./reClone.sh`

Essentially an elaborate git pull.


### namespacedCreate.sh

*This is currently broken, please don't use it.*



## InfluxDB / Grafana

### query.sh
`./query.sh [-d|--databases] [-c|--cpu] [-k|--ksm] ["select+*+from+telegraf.."]`

`-d|--databases )` Shows the databases that currently exist in Influx.

`-c|--cpu )` Shows all data from the `cpu` table using `select+*+from+telegraf..cpu`.

`-k|--ksm )` Shows all data from the `kube_pod_container_status_restarts_total` table using a query similar to that used for `cpu`.

`"select+some+query+string"` Shows data depending on the inputted IFQL query.

Query the Influx database for all supplied options, predefined or otherwise.


### echoGrafanaIP.sh

`./echoGrafanaIP.sh [-s|--start]`

Display the current IP of the Grafana service. Optional `-s|--start` flag to start Grafana using Firefox.

### generateDashboards.sh

`./generateDashboards.sh`

Dynamically generate and import various dashboards for each node in your Kubernetes cluster.



## Kapacitor

### connectToKapacitorContainer.sh
`./connectToKapacitorContainer.sh`

This will exec you into the Kapacitor pod, to allow for manual Kapacitor configuration.


### copyTickScripts.sh

`./copyTickScripts.sh`

Copy the various TICKscripts from their folder in the Kapacitor chart, into the pod.


### defineTickTasks.sh

`./defineTickTasks.sh`

This is 'used' in tandem with `copyTickScripts.sh`, but the script may fail. Manually running the commands within works though(?).


### tailKapacitorLogs.sh

`./tailKapacitorLogs.sh`

This will watch the Kapacitor logs for updates.

### slackAlertToEmail.sh

`./slackAlertToEmail.sh`

This is meant to quickly replace TICKscript slack alerts with simple email alerts. It is highly experimental and requires further configuration to support it.

Namely, a [Topic Handler and SMTP configuration](https://docs.influxdata.com/kapacitor/v1.5/event_handlers/email/) for Kapacitor's [configuration file](https://github.com/Eliforbes42/cronus-monitoring/blob/master/charts/kapacitor/templates/config.yaml#L114).


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

### testTickScripts.sh

`./testTickScripts.sh`

Run Kapacitor-Unit Tests.


### cleanUpTest.sh

`./cleanUpTest.sh`

Clean up Helm Test pods.


### initJenkins.sh

`./initJenkins.sh`


### setupJenkinsContainerSsh.sh

`./setupJenkinsContainerSsh.sh`
