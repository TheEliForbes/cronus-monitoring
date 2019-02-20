# Flux language setup
## Manual Setup
- [Flux](https://docs.influxdata.com/flux/v0.12/) is still in beta, so this information may be out of date
- [Enable](https://docs.influxdata.com/flux/v0.12/introduction/installation) Flux by setting the `flux-enabled` option to `true` under the `http` section of your influxdb.conf
- Follow instructions laid out by [Flux Datasource for Grafana](https://grafana.com/plugins/grafana-influxdb-flux-datasource)

## Cronus-Monitoring Setup
- Run the init.sh script in the scripts directory and the included helm chart will enable flux automatically


## Helpful information
- Read more about [Flux](https://github.com/influxdata/platform/tree/master/query)

## How to begin writing queries in grafana
1. Open the dashboard you wish to work with
2. Open the panel you wish to work with
3. Open the drop down menu for Data Sources, and click the influx-flux data source to select it as the datasource for this panel
4. The query editor will switch to a flux IDE
    > Be wary, any enter key press will cause your query to run, use shift+enter to produce a return character
        > Easy fix is to leave the `from(bucket: "undefined")` pre-made query until you are done writing your query, this makes the query run on an undefined database in InfluxDB, so you can continue to work without overloading the grafana IDE
    > Grafana's autocomplete is very aggressive
        > Tab key autcompletes

## Testing
- Flux has built in testing, but currently only [`assertEquals()`](https://docs.influxdata.com/flux/v0.12/functions/tests/assertequals/) to test queries inline, this can only be done at runtime of the flux query, this may be able to be automated via url queries to influxdb, but further investigation will need to be done

## Tips and Tricks
- Use the [`limit()`](https://docs.influxdata.com/flux/v0.12/functions/transformations/limit/) function to reduce the number of datapoints so that the master node of the kubernetes cluster doesn't get dropped
- [`Join()`](https://docs.influxdata.com/flux/v0.12/functions/transformations/join) is not a pipe function do not use the pipe forward operator in front of it
- Do not press the Tab key while in the editor as it will autocomplete code you may not want to insert.
- Leave the `from(bucket: "undefined")` pre-made query until you are done writing your query, this makes the query run on an undefined database in InfluxDB, so you can continue to work without overloading the grafana IDE