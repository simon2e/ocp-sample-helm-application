# Monocular[https://github.com/kubernetes-helm/monocular]

## Install Monocular

```
oc new-project pr-monocular --description="Monocular Project" --display-name="Monocular Project"
helm repo add monocular https://kubernetes-helm.github.io/monocular
helm install monocular/monocular
oc expose service elevated-rottweiler-monocular-api
oc expose service elevated-rottweiler-monocular-prerender
oc expose service elevated-rottweiler-monocular-ui
```

