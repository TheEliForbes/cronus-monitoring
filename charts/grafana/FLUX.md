# Flux language setup
## Manual Setup
- Flux is still in beta, so this information may be out of date
- Enable Flux by setting the flux-enabled option to true under the http section of your influxdb.conf
- Follow instructions laid out by [Flux Datasource for Grafana](https://grafana.com/plugins/grafana-influxdb-flux-datasource)


## Helpful information
* Read more about Flux [here](https://github.com/influxdata/platform/tree/master/query)

## How to begin writing queries in grafana
1. Open the panel you wish to work with
2. Open the drop down for Data Sources and click the influx-flux data source
3. The query editor will switch to a flux IDE
    - (Be wary, any enter key press will cause your query to run, use shift+enter to produce a return character)
        - (easy fix is to leave the `from(bucket: "undefined")` until you are done writing your query)
    - (Grafana's autocomplete is very aggressive)

## Testing
- Flux has built in testing, but currently only [`assertEquals()`](https://docs.influxdata.com/flux/v0.12/functions/tests/assertequals/) to test queries inline

## Tips and Tricks
- Use the [`limit()`](https://docs.influxdata.com/flux/v0.12/functions/transformations/limit/) function to reduce the number of datapoints so that the master node of the kubernetes cluster doesn't get dropped
- [`Join`](https://docs.influxdata.com/flux/v0.12/functions/transformations/join) is not a pipe function do not use the pipe forward operator in front of it