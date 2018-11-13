# Scripts

This is a collection of scripts that may come in handy when developing or using the stack.

## InfluxDB / Grafana
### query.sh
`./query.sh [-d|--databases] [-c|--cpu] [-k|--ksm] ["select+*+from+telegraf.."]`
`-d|--databases )` Shows the databases that currently exist in Influx.
`-c|--cpu )` Shows all data from the `cpu` table using `select+*+from+telegraf..cpu`
`-k|--ksm )` Shows all data from the `kube_pod_container_status_restarts_total` table using a query similar to that used for `cpu`.
This will query the Influx database for all given options, predefined or otherwise.
### echoGrafanaIP.sh
`./echoGrafanaIP.sh [-s|--start]`
This will display the current IP of the Grafana service. Optional `-s|--start` flag to start Grafana using Firefox.

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

## Testing
### cleanUpTest.sh
`./cleanUpTest.sh`
### testHelm.sh
`./testHelm.sh`
### initJenkins.sh
`./initJenkins.sh`
### setupJenkinsContainerSsh.sh
`./setupJenkinsContainerSsh.sh`




## General
### dockerKube.bash
`./dockerKube.bash`
This was used for automatic installation of a good Docker/Kubernetes base, and is left here since it makes the stack work for *our* developers.
### reClone.sh
`./reClone.sh`
This is essentially an elaborate git pull.
### upgradeHelm.sh
`./upgradeHelm.sh`
This is used for upgrading an existing stack when repo updates happen.