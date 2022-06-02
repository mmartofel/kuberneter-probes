oc new-project project01
oc apply -f frontend-pvc.yaml
oc apply -f microservice-pvc.yaml
# oc apply -f mmartofe-wally-secret.yaml
oc apply -f pipeline-quarkus-api-build-pipeline.yaml
oc apply -f pipeline-skopeo-copy-to-quay.yaml
