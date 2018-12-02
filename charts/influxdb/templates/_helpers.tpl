{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Dynamically define the namespace from the release,
 to be used within the many linking urls. (ex. http://data-influxdb{{ template "namespace" }}:8086/)
{{- define "namespace -}}
{{- printf "%s" .Release.Namespace -}}
{{- end -}}
 
{{/*
Create the namespace of the deployment
*/}}
{{ $global := . }}
{{ tpl (trimAll "\"'" .Values.currentnamespace) $global }}
