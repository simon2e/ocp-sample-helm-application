# [ChartMuseum](https://github.com/kubernetes-helm/chartmuseum)

## Installing ChartMuseum

```
oc new-project pr-chartmuseum --description="ChartMuseum Project" --display-name="ChartMuseum Project"
helm install stable/chartmuseum
oc expose service smelly-quoll-chartmuseum
```

## Create a Chart

```
cd ocp-sample-helm-application/
helm package .
```

## Upload Chart

curl --data-binary "@ocp-sample-helm-application-0.0.1.tgz" http://smelly-quoll-chartmuseum-pr-sample-application.192.168.99.100.nip.io/api/charts

## Installing Charts into Kubernetes

```
helm repo add chartmuseum http://smelly-quoll-chartmuseum-pr-sample-application.192.168.99.100.nip.io
helm search chartmuseum/
helm install chartmuseum/ocp-sample-helm-application
```
