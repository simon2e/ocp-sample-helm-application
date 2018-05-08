# [Monocular](https://github.com/kubernetes-helm/monocular)

## Install Monocular

```
oc new-project pr-monocular --description="Monocular Project" --display-name="Monocular Project"
helm repo add monocular https://kubernetes-helm.github.io/monocular
helm install monocular/monocular
oc expose service elevated-rottweiler-monocular-api
oc expose service elevated-rottweiler-monocular-prerender
oc expose service elevated-rottweiler-monocular-ui
```

## Add Repos

name: stable
url: http://storage.googleapis.com/kubernetes-charts
source: https://github.com/kubernetes/charts/tree/master/stable

name: incubator
url: http://storage.googleapis.com/kubernetes-charts-incubator
source: https://github.com/kubernetes/charts/tree/master/incubator

name: monocular
url: https://kubernetes-helm.github.io/monocular
source: https://github.com/kubernetes-helm/monocular/tree/master/charts

