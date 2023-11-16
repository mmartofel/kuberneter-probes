
oc apply -f secret.yaml -n project01
# oc apply -f 13372670_node-secret.yaml -n project01
oc patch serviceaccount pipeline -p '{"secrets": [{"name": "quay-secret"}]}' -n project01
# oc patch serviceaccount pipeline -p '{"secrets": [{"name": "13372670_node-secret"}]}' -n project01

