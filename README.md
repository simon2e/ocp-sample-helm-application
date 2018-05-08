

Install Helm

oc login -u system:admin

kubectl -n kube-system create sa tiller

kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

helm init --service-account tiller

oc project pr-sample-application

helm install --dry-run --debug ./ocp-sample-helm-application

helm install --name sample-app ./ocp-sample-helm-application

helm del --purge sample-app

helm delete sample-app

