
# Cronus Monitoring
A modified version of the InfluxData 'TICK' Stack which uses Grafana as its UI and dynamically forms to the Kubernetes Cluster it is deployed on.

## Installation

Clone the repo and dive in!

`git clone https://github.com/Eliforbes42/TIKsm-setup.git`

### Pre-Configuration

#### Slack Alert Bot
To allow Kapacitor to post alerts to your Slack channel, follow the instructions below.

1. Create an Incoming Webhook for Slack.

    1.1. If you're unfamiliar with Slack Webhooks, follow [this guide](https://api.slack.com/incoming-webhooks).

2. Modify the Kapacitor Configuration to post to your Slack Channel.

    2.1. Open up `/TIKsm-setup/gtikk-charts/kapacitor/templates/config.yaml`

    2.2. Modify the `[[slack]]` section, [lines 134-142](https://github.com/Eliforbes42/TIKsm-setup/blob/master/gtikk-charts/kapacitor/templates/config.yaml#L134).
    
    2.3. Change the `workspace`, `url`, `channel`, and `username` as necessary.

#### Grafana Dashboards
To automatically import Dashboards destined for Grafana, place all JSON files in the following folder: 

`/TIKsm-setup/gtikk-charts/grafana/dashboards/`

### Setup
1.   Make everything extremely executable, if you're daring..
         
         cd TIKsm-setup/scripts

         chmod +x *.sh

2.   Run the initialization script.
                   
         sudo ./init.sh

        2.1.   Tiller may take a bit to set up, so Helm Chart installation may fail. Try again with the following script:

           sudo ./create.sh

3.   Verify Kube-State-Metrics' Prometheus endpoint is operational.

         ./curl.sh

4.   Verify InfluxDB is operational, and receiving data from Telegraf.

         ./query.sh -c

5.   Now that the stack is set up, define the TICKscripts.

        5.1 `./copyTickScripts.sh`  

        5.2 `./defineTickTasks.sh`

        5.2.1 If 5.2 doesn't work, run the commands below.       

        5.2.2 `./connectToKapacitorContainer.sh`

        5.2.3 `chmod +x TICKscripts/defineTasks.sh`

        5.2.4 `./TICKscripts/defineTasks.sh`

## Usage

-  `./echoGrafanaIP.sh -s`

    -  The `-s` flag starts Grafana in Firefox.

    > _Grafana is at http://your.grafana.cluster.ip_


## Stack Manipulation

- Set up Stack:  `./create.sh`

- Remove Stack:  `./destroy.sh`

- Upgrade Stack: `./upgrade.sh`        

## Port Info
* Kube-State-Metrics: [`8085`](https://github.com/Eliforbes42/TIKsm-setup/blob/master/gtikk-charts/kube-state-metrics/values.yaml#L8)

* InfluxDB: [`8086`](https://github.com/Eliforbes42/TIKsm-setup/blob/master/gtikk-charts/influxdb/values.yaml#L103)

* Kapacitor: [`9092`](https://github.com/Eliforbes42/TIKsm-setup/blob/master/gtikk-charts/kapacitor/templates/config.yaml#L17)

* Grafana: [`80`](https://github.com/Eliforbes42/TIKsm-setup/blob/master/gtikk-charts/grafana/values.yaml#L58)
