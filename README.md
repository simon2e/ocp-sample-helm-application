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

## Setup Helm

```
oc login -u system:admin
oc create serviceaccount tiller -n kube-system
oc adm policy add-cluster-role-to-user cluster-admin -z tiller -n kube-system
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
oc project pr-sample-application
```

### Helm Install Commands

```
helm install --dry-run --debug ./ocp-sample-helm-application
helm install --name sample-app ./ocp-sample-helm-application
```

### Helm Delete Commands

```
helm del --purge sample-app
helm delete sample-app
```
