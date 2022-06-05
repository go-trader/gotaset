# Gotaset

Gotaset is the visualization tool for [Gotrader](github.com/totomz/gotrader).
Gotaset is a simple JSON-based datasource for [Grafana](https://grafana.com/), based on the great [simpod-json](https://grafana.com/grafana/plugins/simpod-json-datasource/) plugin

# How does it work
The `docker-compose.yaml` file starts both Gotaset and Grafana. 
```shell
# Set SIGHOME to the folder containing signals_grafana.json
SIGHOME=${PWD}/sample-files
SIGHOME=${PWD}/sample-files docker-compose up
```

## Standalone
```shell
go install github.com/go-trader/gotaset@latest
```
