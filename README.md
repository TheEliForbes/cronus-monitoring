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

         ./curl.sh

6.   Verify InfluxDB is operational, and receiving data from Telegraf

         ./query.sh

7.   Now that the stack is set up, define the TICKscripts

        7.1 ./copyTickScripts.sh         
       
        7.2 Then dive into the Kapacitor Container, ./connectToKapacitorContainer.sh



## Usage

1.    `./echoGrafanaIP.sh`
        > _Grafana is at http://your.grafana.cluster.ip_
2.  Navigate there in your desktop VM's browser.
	
        2.1 Everything should already be set up!



## Port Info
* Kube-State-Metrics: `8085`
* InfluxDB: `8086`
* Kapacitor: `9092`
* Grafana: `80`