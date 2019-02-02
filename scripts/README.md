# Scripts

This is a collection of scripts that our developers have found useful when using the stack.



## General

### init.sh

`sudo ./init.sh`

This is your initialization script, it will handle all installation and configuration that is programatically possible.


### create.sh

`./create.sh`

Create the stack from the given Helm Charts, this assumes that you have the needed 'setup' completed. If you do not have the required software, see the main 'readme'.

> This uses the `helm install` command to set up each chart.


### destroy.sh

`./destroy.sh`

Tear down the stack, if you ever need to do that for testing purposes or due to extenuating circumstances.

> This uses the `helm del` command, using the option to purge pod data.


### upgrade.sh

`./upgrade.sh`

Upgrade an existing stack when updates happen.

> This uses the `helm upgrade` command, and is naturally similar to the `create.sh` script.


### installHelm.sh

`./installHelm.sh`

This installs Helm 2.11 a version that works well enough for Cronus developers.


### dockerKube.bash

`./dockerKube.bash`

This was used for automatic installation of a good Docker/Kubernetes base, and is left here since it makes the stack work for Cronus developers.


### reClone.sh

`./reClone.sh`

Essentially an elaborate git pull.


### namespacedCreate.sh

*This is currently broken, please don't use it.*

> The idea here is to allow deployment over any namespace.


## InfluxDB / Grafana

### query.sh
`./query.sh [-d|--databases] [-c|--cpu] [-k|--ksm] ["select+*+from+telegraf.."]`

`-d|--databases )` Shows the databases that currently exist in Influx.

`-c|--cpu )` Shows all data from the `cpu` table using `select+*+from+telegraf..cpu`.

`-k|--ksm )` Shows all data from the `kube_pod_container_status_restarts_total` table using a query similar to that used for `cpu`.

`"select+some+query+string"` Shows data depending on the inputted IFQL query.

Query the Influx database for all supplied options, predefined or otherwise.


### echoGrafanaIP.sh

`./echoGrafanaIP.sh`

Display the current IP of the Grafana service.

### startGrafana.sh

`./startGrafana.sh ["browserName"]`

Start Grafana using Firefox, or an alternate browser.

### generateDashboards.sh

`./generateDashboards.sh [-s | --select]`

Dynamically generate and import various dashboards for each node in your Kubernetes cluster. 

Optionally, pass `-s` or `--select`, to select which nodes to generate dashboards for.



## Kapacitor

### connectToKapacitorContainer.sh
`./connectToKapacitorContainer.sh`

This will exec you into the Kapacitor pod, to allow for manual Kapacitor configuration and testing.


### copyTickScripts.sh

`./copyTickScripts.sh`

Copy TICKscripts from their folder in the Kapacitor chart, into the Kapacitor pod.

> This uses the `kubectl cp` command, and is complemented by `defineTickTasks.sh` below.

### defineTickTasks.sh

`./defineTickTasks.sh`

This is used in tandem with `copyTickScripts.sh`. It might occasionally fail, but manually running the commands within still works.

> This uses `kubectl exec` to jump into the pod, where it can define tasks with a script.


### tailKapacitorLogs.sh

`./tailKapacitorLogs.sh`

This will watch the Kapacitor logs for updates.

> This can be useful for alert testing/debugging.

### slackAlertToEmail.sh

`./slackAlertToEmail.sh`

This is meant to quickly replace TICKscript slack alerts with simple email alerts. It is highly experimental and requires further configuration to support it.

Namely, a [Topic Handler and SMTP configuration](https://docs.influxdata.com/kapacitor/v1.5/event_handlers/email/) for Kapacitor's [configuration file](https://github.com/Eliforbes42/cronus-monitoring/blob/master/charts/kapacitor/templates/config.yaml#L114).


### deprecatedTikInstall.bash

`./deprecatedTikInstall.bash`

This is the old way of doing it, and is left as a potential exercise for the *daring* user.



## Kube-State-Metrics

### curl.sh

`./curl.sh ["port"]`

This queries the Kube-State-Metrics Prometheus endpoint and displays it's data, with an optional parameter to use an alternate port.



## Testing

### helmTest.sh

`./helmTest.sh [-n]`

Run native Helm Tests and Helm Unit Tests, and clean up the created test-pods.

> If for whatever reason you don't want to clean up the test-pods, use the `-n` flag.

### testTickScripts.sh

`./testTickScripts.sh`

Run Kapacitor-Unit Tests.


### cleanUpTest.sh

`./cleanUpTest.sh`

Clean up Helm Test pods.


### initJenkins.sh

`./initJenkins.sh`

Initial Jenkins Setup Script

### setupJenkinsContainerSsh.sh

`./setupJenkinsContainerSsh.sh`

This script should be run after the in-UI setup process for Jenkins.