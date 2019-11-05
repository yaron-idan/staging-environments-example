{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "web-api.name" -}}
{{- if eq .Values.environment "production" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" (default .Chart.Name .Values.nameOverride | trunc 54) (default "staging" .Values.environment) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "web-api.name-without-env" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "web-api.replicaCount" }}
{{- if eq .Values.environment "production" }}
replicas: {{ .Values.replicaCount }}
{{- else }}
replicas: 1
{{- end }}
{{- end }}

{{- define "web-api.imagePullPolicy" }}
{{- if eq .Values.environment "production" }}
imagePullPolicy: {{ .Values.image.pullPolicy }}
{{- else }}
imagePullPolicy: Always
{{- end }}
{{- end }}

{{- define "web-api.resources" }}
{{- if eq .Values.environment "production" }}
{{ toYaml .Values.resources | indent 4 }}
{{- else }}
    limits:
      cpu: 100m
      memory: 128Mi
    requests:
      cpu: 100m
      memory: 128Mi
{{- end }}
{{- end }}

{{- define "web-api.tlsSecretName" }}
{{- if eq .Values.environment "production" }}
{{- .Values.ingress.tls.secretName }}
{{- else }}
{{- .Values.ingress.tls.prSecretName }}
{{- end }}
{{- end }}
