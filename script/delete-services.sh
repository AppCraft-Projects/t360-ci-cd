# we need pwd to be the script's dir
cd "$(dirname "$0")" || exit 1

bash ./stop-services.sh

echo "Deleting containers..."
docker container rm jenkins-docker
docker container rm jenkins-blueocean
docker container rm gitlab

echo "Cleaning up Jenkins resources..."
docker network rm cicd || true
docker volume rm jenkins-docker-certs || true
docker volume rm jenkins-data || true