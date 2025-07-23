oc new-project project01
oc apply -f frontend-pvc.yaml
oc apply -f api-pvc.yaml
oc apply -f mmartofe-wally-secret.yaml
oc apply -f pipeline-quarkus-application-pipeline.yaml
# oc apply -f pipeline-quarkus-api-build-pipeline.yaml
# oc apply -f pipeline-quarkus-api-build-pipeline-no-nexus.yaml
# oc apply -f pipeline-skopeo-copy-to-quay.yaml
# oc apply -f pipeline-scan-image.yaml
# oc apply -f ./custom_tasks/grype.yaml
# oc apply -f ./custom_tasks/trivy-scanner.yaml

# ./create-quay-pull-secret.sh
# ../../registry_secret.sh
# oc apply -f 13372670-node-pull-secret.yaml

# Advanced Cluster Security only option
# oc apply -f ./stackrox_tasks/rox-deployment-check-task.yml
# oc apply -f ./stackrox_tasks/rox-image-check-task.yml
# oc apply -f ./stackrox_tasks/rox-image-scan-task.yml
# oc apply -f ./stackrox_pipeline/rox-secrets.yml
# oc apply -f ./stackrox_pipeline/rox-pipeline.yml

# Sonatype Nexus Repository setup
oc apply -f ./nexus/maven-settings.yaml
oc apply -f ./nexus/nexus-template.yaml

# oc adm policy add-cluster-role-to-user cluster-admin -z default -n project01
# oc adm policy add-cluster-role-to-user cluster-admin -z builder -n project01
# oc adm policy add-cluster-role-to-user cluster-admin -z deployer -n project01
# oc adm policy add-cluster-role-to-user cluster-admin -z pipeline -n project01

# ./patch.sh

