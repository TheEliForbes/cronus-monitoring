# GKIT/Helm

## Installation

1.   Clone the repo and dive in!

         git clone https://github.com/Eliforbes42/TIKsm-setup

         cd TIKsm-setup/gtikk-charts

2.   Make everything extremely executable, if you're daring..

         chmod +x *.sh

3.   Run the init.sh script
                   
         sudo ./init.sh

4.   Tiller may take a bit to set up, and therefore helm installation may fail, try again with the following script

         sudo ./create.sh

5.   Verify KSM is operational with super smart script

         ./scripts/curl.sh

6.   Verify InfluxDB is operational, and receiving data from Telegraf

         ./scripts/query.sh

7.   Now that the stack is set up, define the TICKscripts

        7.1 `./copyTickScripts.sh`  

        7.2 `./defineTickTasks.sh`

        7.2.1 If that doesn't work, follow the below.       

        7.2.2 `./connectToKapacitorContainer.sh`

        7.2.3 `chmod +x TICKscripts/defineTasks.sh`

        7.2.4 `./TICKscripts/defineTasks.sh`

## Usage

1.  `./scripts/echoGrafanaIP.sh -s`

    1.1.  The `-s` flag starts Grafana in Firefox

    > _Grafana is at http://your.grafana.cluster.ip_





## Port Info
* Kube-State-Metrics: `8085`
* InfluxDB: `8086`
* Kapacitor: `9092`
* Grafana: `80`