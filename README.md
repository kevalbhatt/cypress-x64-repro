# Build the docker

./e2e-docker-build.sh


# Run the docker img

docker run -it --platform linux/arm64 --name ui-canary-repro-arm ui-canary-repro-arm bash


docker run -it --platform linux/amd64 --name ui-canary-repro-x64 ui-canary-repro-x64 bash


# inside container


cd /etc/
./run.sh
