# Sample Helm OpenShift Template/Mainfest Files

## Summary

This intent is to provide a fully documented and working set of Helm OpenShift manifest files for Levvel Consultants.

This example deploys a Wildfly server and exposes it via a route on minishift.

By having a set of working Helm template files it will be easier to deploy workloads for clients using common requested features.

## Setup Minishift

```
minishift profile set sampleapp
minishift config set memory 8GB
minishift config set cpus 2
minishift config set image-caching true
minishift addons install --defaults
minishift addon enable admin-user
minishift addons enable anyuid
minishift config set openshift-version v3.9.0
minishift start --vm-driver=virtualbox --profile sampleapp --metrics
```

## Install [Helm](https://docs.helm.sh/using_helm/)


## Configure Helm

```
oc login -u system:admin
oc create serviceaccount tiller -n kube-system
oc adm policy add-cluster-role-to-user cluster-admin -z tiller -n kube-system
oc project kube-system
helm init --service-account tiller
```

## Clone the Project

```
git clone https://github.com/GetLevvel/ocp-sample-helm-application.git
```

## Install Sample Application via Helm

### Change to the target Project

```
oc login -u system:admin
oc new-project pr-sample-application --description="Sample Application Project" --display-name="Sample Application Project"
oc project pr-sample-application
```

### Helm Install Commands

```
cd
helm del --purge sample-app
helm install --dry-run --debug ./ocp-sample-helm-application
helm install --name sample-app ./ocp-sample-helm-application
```

```
jamesb@Surface:~$ helm install --name sample-app ./ocp-sample-helm-application
NAME:   sample-app
LAST DEPLOYED: Tue May  8 11:58:36 2018
NAMESPACE: pr-sample-application
STATUS: DEPLOYED

RESOURCES:
==> v1/Route
NAME           AGE
rt-sample-app  0s

==> v1/Service
NAME            TYPE       CLUSTER-IP    EXTERNAL-IP  PORT(S)   AGE
svc-sample-app  ClusterIP  172.30.45.15  <none>       8080/TCP  0s

==> v1/DeploymentConfig
NAME           AGE
dc-sample-app  0s

==> v1/ImageStream
is-sample-app  0s
```

### Helm Delete Commands

```
helm del --purge sample-app
helm delete sample-app
```
