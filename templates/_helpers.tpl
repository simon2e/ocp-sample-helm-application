{{/* vim: set filetype=mustache: */}}
{{/* Template for env vars  */}}
{{- define "ui.envvars" -}}
{{- range $key, $val := .Values.envvars }}
  - name: {{ $key }}
    value: {{ $val }}
{{- end }}
{{- end -}}
