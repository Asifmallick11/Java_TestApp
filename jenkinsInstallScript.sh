sudo docker network create jenkins
sudo docker volume create jenkins-data
sudo docker volume create jenkins-docker-certs

sudo docker container run --name jenkins-docker --rm --detach \
    --privileged --network jenkins --network-alias docker \
    --env DOCKER_TLS_CERTDIR=/certs \
    --volume jenkins-docker-certs:/certs/client \
    --volume jenkins-data:/var/jenkins_home \
    --volume "$HOME":/home docker:dind

sudo docker container run --name jenkins-tutorial --rm --detach \
    --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
    --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
    --volume jenkins-data:/var/jenkins_home \
    --volume jenkins-docker-certs:/certs/client:ro \
    --volume "$HOME":/home --publish 8080:8080 myjenkins-blueocean:2.492.3
#----------------------------------------------------------------------------------------
sudo docker container run --name jenkins-tutorial --rm --detach \
    --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
    --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
    --volume jenkins-data:/var/jenkins_home \
    --volume jenkins-docker-certs:/certs/client:ro \
    --volume "$HOME":/home --publish 8080:8080 jenkinsci/blueocean
#-----------------------------------------------------------------------------------------
sudo docker container run --name jenkins-tutorial --rm --detach \
    --network jenkins \
    --env DOCKER_HOST=tcp://docker:2376 \
    --env DOCKER_CERT_PATH=/certs/client \
    --env DOCKER_TLS_VERIFY=1 \
    --volume jenkins-data:/var/jenkins_home \
    --volume jenkins-docker-certs:/certs/client:ro \
    --volume "$HOME":/home \
    --publish 8080:8080 \
    jenkins/jenkins:lts
#-----------------------------------------------------------------------------------------