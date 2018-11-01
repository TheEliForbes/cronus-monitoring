
# GKIT/Helm

## Installation

1.   Clone the repo and dive in!

         git clone [https://github.com/Eliforbes42/TIKsm-setup](https://github.com/Eliforbes42/TIKsm-setup)

         cd TIKsm-setup/gtikk-charts

2.   Make everything extremely executable, if you're daring..

         chmod +x *.sh

3.   Run the init.sh script* (may need sudo privileges)
                   
         sudo ./init.sh
        *Once it asks you to set up GKIT, you may want to wait a minute before continuing

4.   Tiller may take a bit to set up, and therefore helm installation may fail.

        Try again with the following script

         sudo ./create.sh

5.   Verify KSM is operational with super smart script

         ./curl.sh

6.   Verify InfluxDB is operational, and receiving data from Telegraf

         ./query.sh
       
7.   You can also dive into the Kapacitor Container

           ./connectToKapacitorContainer.sh

## Usage

1.    `./echoGrafanaIP.sh`
2. > _Grafana is at http://your.grafana.cluster.ip_
3.  Navigate there in your desktop VM's browser.

### First-time Use
1.  Add Data Source in Grafana

    -   Settings > Data Sources > Add data source

    -   Name: `influx`
    -   Type: InfluxDB
    -   URL: [http://data-influxdb.kube-system:8086](http://data-influxdb.kube-system:8086)
    -   Access: Server
    -   InfluxDB Details > Database: `telegraf`

2.   Import Dashboard

     -   Create > Import > Upload .json File
   
      -   Select file
         
           -[Restarts Dashboard-1540495620364.json](https://github.com/Eliforbes42/TIKsm-setup/blob/master/Restarts%20Dashboard-1540495620364.json "Restarts Dashboard-1540495620364.json")
         
      -   Set InfluxDB datasource, `influx`
