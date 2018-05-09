# [Monocular](https://github.com/kubernetes-helm/monocular)

## Install Monocular

```
oc new-project pr-monocular --description="Monocular Project" --display-name="Monocular Project"
helm repo add monocular https://kubernetes-helm.github.io/monocular
oc project pr-monocular
# helm install --name monocular -f custom-repos.yaml monocular/monocular
helm install --name monocular -f separate-domains.yaml monocular/monocular
oc expose service monocular-monocular-api
# oc expose service monocular-monocular-prerender
oc expose service monocular-monocular-ui
```

## Delete Monocular

```
helm del --purge monocular
```

## Repositories

name: stable
url: http://storage.googleapis.com/kubernetes-charts
source: https://github.com/kubernetes/charts/tree/master/stable

name: incubator
url: http://storage.googleapis.com/kubernetes-charts-incubator
source: https://github.com/kubernetes/charts/tree/master/incubator

name: monocular
url: https://kubernetes-helm.github.io/monocular
source: https://github.com/kubernetes-helm/monocular/tree/master/charts

