tkn pipeline start skopeo-copy-to-quay \
  --namespace=project01 \
  --serviceaccount=build-bot \
  --workspace name=shared-volume,claimName=pipeline-pvc \
  --showlog
