{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'resource-state-alert.rules',
        rules: [
          {
            alert: 'NooBaaResourceErrorState',
            expr: |||
              NooBaa_resource_status{resource_name=~".*"} == 0
            ||| % $._config,
            'for': $._config.resourceErrorStateAlertTime,
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'A NooBaa Resource Is In Error State',
              description: 'A NooBaa resource {{ $labels.resource_name }} is in error state for more than %s' % $._config.resourceErrorStateAlertTime,
              storage_type: $._config.storageType,
              severity_level: 'warning',
            },
          },
        ],
      },
    ],
  },
}
