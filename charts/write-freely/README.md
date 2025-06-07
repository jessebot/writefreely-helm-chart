# writefreely

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.15.1](https://img.shields.io/badge/AppVersion-v0.15.1-informational?style=flat-square)

A Helm chart for deploying writefreely on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jessebot |  | <https://jessebot.work> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | mysql | 13.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | pod affinity |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| externalDatabase.database | string | `"writefreely"` | hostname of the external database |
| externalDatabase.enabled | bool | `false` | enable external database. requires mysql.enabled=false |
| externalDatabase.existingSecret.name | string | `""` | name of an existing K8s Secret to use. If set, ignores externalDatabase.hostname/port/username/password |
| externalDatabase.existingSecret.secretKeys.database | string | `"mysql-database"` | key in existing Secret for database external database name |
| externalDatabase.existingSecret.secretKeys.hostname | string | `"mysql-hostname"` | key in existing Secret for database external database hostname |
| externalDatabase.existingSecret.secretKeys.password | string | `"mysql-password"` | key in existing Secret for database external database password |
| externalDatabase.existingSecret.secretKeys.port | string | `"mysql-port"` | key in existing Secret for database external database port |
| externalDatabase.existingSecret.secretKeys.username | string | `"mysql-username"` | key in existing Secret for database external database username |
| externalDatabase.hostname | string | `"mysql"` | hostname of the external database server |
| externalDatabase.password | string | `""` | hostname of the external database password |
| externalDatabase.port | string | `"3306"` | hostname of the external database port |
| externalDatabase.username | string | `"writefreely"` | hostname of the external database username |
| extraEnv | list | `[]` | extra environment variables |
| fullnameOverride | string | `""` | this really overrides the chart name for real |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. |
| image.repository | string | `"ghcr.io/writefreely/writefreely"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | This is for the secrets for pulling an image from a private repository more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| ingress.annotations | object | `{}` | annotations of the ingress object |
| ingress.className | string | `""` | increasee class name, e.g. nginx |
| ingress.enabled | bool | `false` | enable ingress from outside the k8s cluster |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| mysql.auth.authenticationPolicy | string | `""` | Sets the authentication policy, by default it will use `* ,,` ref: https://dev.mysql.com/doc/refman/8.4/en/server-system-variables.html#sysvar_authentication_policy |
| mysql.auth.createDatabase | bool | `true` | Whether to create the .Values.auth.database or not ref: https://github.com/bitnami/containers/tree/main/bitnami/mysql#creating-a-database-on-first-run |
| mysql.auth.customPasswordFiles | object | `{}` | Use custom password files when `auth.usePasswordFiles` is set to `true`. Define path for keys `root` and `user`, also define `replicator` if `architecture` is set to `replication` Example: customPasswordFiles:   root: /vault/secrets/mysql-root   user: /vault/secrets/mysql-user   replicator: /vault/secrets/mysql-replicator |
| mysql.auth.database | string | `"writefreely"` | Name for a custom database to create ref: https://github.com/bitnami/containers/tree/main/bitnami/mysql#creating-a-database-on-first-run |
| mysql.auth.existingSecret | string | `""` | Use existing secret for password details. The secret has to contain the keys `mysql-root-password`, `mysql-replication-password` and `mysql-password` NOTE: When it's set the auth.rootPassword, auth.password, auth.replicationPassword are ignored. |
| mysql.auth.password | string | `""` | Password for the new user. Ignored if existing secret is provided |
| mysql.auth.replicationPassword | string | `""` | MySQL replication user password. Ignored if existing secret is provided |
| mysql.auth.replicationUser | string | `"replicator"` | MySQL replication user ref: https://github.com/bitnami/containers/tree/main/bitnami/mysql#setting-up-a-replication-cluster |
| mysql.auth.rootPassword | string | `""` | Password for the `root` user. Ignored if existing secret is provided ref: https://github.com/bitnami/containers/tree/main/bitnami/mysql#setting-the-root-password-on-first-run |
| mysql.auth.usePasswordFiles | bool | `true` | Mount credentials as files instead of using an environment variable |
| mysql.auth.username | string | `"writefreely"` | Name for a custom user to create ref: https://github.com/bitnami/containers/tree/main/bitnami/mysql#creating-a-database-user-on-first-run |
| mysql.enabled | bool | `true` | enable the bitnami MySQL helm chart see all possible values: https://github.com/bitnami/charts/blob/main/bitnami/mysql/values.yaml |
| mysql.initdbScripts | object | `{}` | Dictionary of initdb scripts Specify dictionary of scripts to be run at first boot Example: initdbScripts:   my_init_script.sh: |      #!/bin/bash      echo "Do something." |
| mysql.initdbScriptsConfigMap | string | `""` | ConfigMap with the initdb scripts (Note: Overrides `initdbScripts`) |
| mysql.startdbScripts | object | `{}` | Dictionary of startdb scripts Specify dictionary of scripts to be run every time the container is started Example: startdbScripts:   my_start_script.sh: |      #!/bin/bash      echo "Do something." |
| nameOverride | string | `""` | This is to override the chart name. |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` | This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podLabels | object | `{}` | This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` | This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ |
| resources | object | `{}` | resources for the writefreely pod limits:   cpu: 100m   memory: 128Mi requests:   cpu: 100m   memory: 128Mi |
| securityContext | object | `{}` |  |
| service.port | int | `80` | This sets the ports more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports |
| service.type | string | `"ClusterIP"` | This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | pod tolerations of node taints |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. - name: foo   mountPath: "/etc/foo"   readOnly: true |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. - name: foo   secret:     secretName: mysecret     optional: false |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
