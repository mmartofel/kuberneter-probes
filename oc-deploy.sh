
# This way we only about to build an image
./mvnw clean package \
    -Dquarkus.container-image.build=true \
    -Dquarkus.kubernetes-client.trust-certs=true \
    -DskipTests \
  -Dquarkus.profile=ocp

# This way we are about to build an image as well as deploy it together with exposing the route
# ./mvnw clean package \
#     -Dquarkus.kubernetes.deploy=true \
#     -Dquarkus.openshift.deployment-kind=Deployment \
#     -Dquarkus.openshift.route.expose=true \
#     -Dquarkus.kubernetes-client.trust-certs=true \
#     -DskipTests \
#   -Dquarkus.profile=ocp
