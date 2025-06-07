# WriteFreely helm chart
<a href="https://github.com/small-hack/writefreely-helm-chart/releases"><img src="https://img.shields.io/github/v/release/small-hack/writefreely-helm-chart?style=plastic&labelColor=blue&color=green&logo=GitHub&logoColor=white"></a>

An experimental helm chart to release [WriteFreely](https://github.com/writefreely/writefreely) on Kubernetes.

### todo

*add env vars*:
- WF_USER
- WF_PASSWORD
- WF_DB - the database name or database hostname?
- WF_HOST - hostname for writefreely?

## TLDR

See the [`README.md`](https://github.com/small-hack/writefreely-chart/blob/main/charts/writefreely/README.md) for docs auto-generated from the [`values.yaml`](https://github.com/small-hack/writefreely-chart/blob/main/charts/writefreely/values.yaml).

Read through the parameters and modify them locally before installing the chart:

```bash
# add the helm repo locally
helm repo add writefreely https://small-hack.github.io/writefreely-chart

# downloads the values.yaml locally
helm show values writefreely/writefreely > values.yaml

# You should then edit the values.yaml to your liking.

## NOTE: The most important helm parameter is writefreely.hostname
## without it, this chart may not work!

# install the chart
helm install my-release-name writefreely/writefreely --values values.yaml
```
