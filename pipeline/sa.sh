export CONTAINER_REGISTRY_SERVER='quay.io'
export CONTAINER_REGISTRY_USER='mmartofe'
export CONTAINER_REGISTRY_PASSWORD='Redhat12!@'

oc create secret -n project01 docker-registry container-registry-secret \
  --docker-server=$CONTAINER_REGISTRY_SERVER \
  --docker-username=$CONTAINER_REGISTRY_USER \
  --docker-password=$CONTAINER_REGISTRY_PASSWORD

oc create sa -n project01 build-bot

oc patch serviceaccount build-bot \
  -p '{"secrets": [{"name": "container-registry-secret"}]}'

oc get sa -n project01 build-bot -o yaml

oc adm policy add-scc-to-user anyuid -z build-bot -n project01

