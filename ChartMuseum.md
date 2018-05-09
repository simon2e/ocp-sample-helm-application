# [Chart Museum](https://github.com/kubernetes-helm/chartmuseum)

## [Installing Chart Museum](https://github.com/kubernetes/charts/tree/master/stable/chartmuseum)

```
oc new-project pr-chartmuseum --description="ChartMuseum Project" --display-name="ChartMuseum Project"
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm del --purge chartmuseum
helm install --name chartmuseum -f ChartMuseum-custom.yml stable/chartmuseum
oc expose service chartmuseum-chartmuseum
```
## Create a Chart

```
cd ocp-sample-helm-application/
helm package .
```

## Enable API for Chart Upload 

```
cd $HOME/.helm/cache/archive
tar -xvf chartmuseum-1.3.1.tgz
vi chartmuseum/values.yaml
DISABLE_API: true to DISABLE_API: false
tar -zcvf chartmuseum-1.3.1.tgz chartmuseum
helm install --name chartmuseum ./chartmuseum
oc expose service chartmuseum-chartmuseum

## Upload Chart

curl --data-binary "@ocp-sample-helm-application-0.0.1.tgz" http://chartmuseum-chartmuseum-pr-chartmuseum.192.168.99.100.nip.io/api/charts
curl -v http://chartmuseum-chartmuseum-pr-chartmuseum.192.168.99.100.nip.io/index.yaml
```

## Installing Charts into Kubernetes

```
helm repo add chartmuseum http://chartmuseum-chartmuseum-pr-chartmuseum.192.168.99.100.nip.io
helm search chartmuseum/
helm install chartmuseum/ocp-sample-helm-application
```

```
jamesb@Surface:~/ocp-sample-helm-application$ curl --data-binary "@ocp-sample-helm-application-0.0.1.tgz" http://chartmuseum-chartmuse
um-pr-chartmuseum.192.168.99.100.nip.io/api/charts
{"saved":true}

jamesb@Surface:~/ocp-sample-helm-application$ helm repo add chartmuseum http://chartmuseum-chartmuseum-pr-chartmuseum.19
ip.io.99.100.n
"chartmuseum" has been added to your repositories

jamesb@Surface:~/ocp-sample-helm-application$ helm search chartmuseum/
NAME                                    CHART VERSION   APP VERSION     DESCRIPTION
chartmuseum/ocp-sample-helm-application 0.0.1                           Chart for Sample Application
```
