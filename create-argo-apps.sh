oc new-project probes

oc delete AppProject no-kubernetes-probes -n openshift-gitops

oc delete application store  -n openshift-gitops
oc delete application probes -n openshift-gitops
oc delete application frontend -n openshift-gitops

oc adm policy add-cluster-role-to-user cluster-admin -z default -n probes
oc adm policy add-cluster-role-to-user cluster-admin -z builder -n probes
oc adm policy add-cluster-role-to-user cluster-admin -z deployer -n probes
oc adm policy add-cluster-role-to-user cluster-admin -z pipeline -n probes
oc adm policy add-role-to-user admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller -n probes

oc create -f ./deployment/argo/no-kubernetes-probes.yaml -n openshift-gitops
oc create -f ./deployment/argo/store.yaml -n openshift-gitops
oc create -f ./deployment/argo/probes.yaml -n openshift-gitops
oc create -f ./deployment/argo/frontend.yaml -n openshift-gitops
