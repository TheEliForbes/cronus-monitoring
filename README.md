# GKIT/Helm
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

-   Add Data Source in Grafana

    -   Settings > Data Sources > Add data source

    -   Name: influx
    -   Type: InfluxDB
    -   URL: [http://data-influxdb.kube-system:8086](http://data-influxdb.kube-system:8086)
    -   Access: Server
    -   InfluxDB Details > Database: telegraf

-   Import Dashboard

    -   Create > Import > Upload .json File

    -   Select file
    -   Set InfluxDB datasource
