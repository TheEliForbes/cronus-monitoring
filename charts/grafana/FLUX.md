# Flux language setup
## Manual Setup
- [Flux](https://docs.influxdata.com/flux/v0.12/) is still in beta, so this information may be out of date
- [Enable](https://docs.influxdata.com/flux/v0.12/introduction/installation) Flux by setting the `flux-enabled` option to `true` under the `http` section of your influxdb.conf
- Follow instructions laid out by [Flux Datasource for Grafana](https://grafana.com/plugins/grafana-influxdb-flux-datasource)

## Cronus-Monitoring Setup
- Run the init.sh script in the scripts directory and the included helm chart will enable flux automatically
    - Flux is enabled in Grafana via the [values.yaml](https://github.com/Eliforbes42/cronus-monitoring/blob/master/charts/grafana/values.yaml) `datasources` with `grafana-influxdb-flux-datasource` as the type
    
    - Flux is enabled in InfluxDB via the [values.yaml](https://github.com/Eliforbes42/cronus-monitoring/blob/master/charts/influxdb/values.yaml) `[http]` with `flux_enabled` being set to true and [influxdb/templates/config.yaml](https://github.com/Eliforbes42/cronus-monitoring/blob/master/charts/influxdb/templates/config.yaml) taking that value and deploying the flux enabled InfluxDB

## Helpful information
- Read more about [Flux](https://github.com/influxdata/platform/tree/master/query)

## How to begin writing queries in grafana
1. Open the dashboard you wish to work with and edit or create the panel you wish to work with
2. Click the drop down menu for `Data Sources`, and click the `influx-flux` data source to select it as the datasource for this panel
3. The query editor will switch to a flux IDE
    > Be wary, any enter key press will cause your query to run, use shift+enter to produce a return character. Also the Grafana IDE autocompletion is very aggressive with a press of the tab key autocompleting several lines of query at a time

## Testing
- Flux has built in testing, but currently only [`assertEquals()`](https://docs.influxdata.com/flux/v0.12/functions/tests/assertequals/) to test queries inline, this can only be done at runtime of the flux query, this may be able to be automated via url queries to influxdb, but further investigation will need to be done

## Tips and Tricks
- Use the [`limit()`](https://docs.influxdata.com/flux/v0.12/functions/transformations/limit/) function to reduce the number of rows queried from InfluxDB, this should be done because the current iteration of the Grafana plugin for flux does not handle large quantities of rows
- [`join()`](https://docs.influxdata.com/flux/v0.12/functions/transformations/join) is not a pipe function does not use the pipe forward operator, `join()` instead is a start point for that line of the query
- Do not press the tab key while in the editor as it will autocomplete code you may not want to insert
- Leave the `from(bucket: "undefined")` pre-made query until you are done writing your query, this makes the query run on an undefined database in InfluxDB, so development can continue without overloading the grafana IDE