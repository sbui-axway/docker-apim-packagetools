![Build Status](https://dev.azure.com/sbui/apim-emt/_apis/build/status/sbui-axway.docker-apim-packagetools?branchName=master)

# docker-apim-packagetools

This repository allow to create a azure devops container agent, containing the axway apim package deploy tools, in order to build a apim archive ( FED, POL).

## Usage
1. clone this repository
2. Download from the Axway support site the api gateway installer, put it in the root directory and rename it as APIGateway_Install.run
3. build the docker image
```bash
docker build -t apigw-client:7.7.20200330 .  
```
4. In order to launch the container we need a azure devops account and a PAT ( personnal access token)
```bash
docker run --name builder -d  -e AZP_URL=https://dev.azure.com/<USER>/ -e AZP_TOKEN=<PAT> -e AZP_AGENT_NAME=fed_builder apigw-client:7.7.20200330  
```
5. Once the container is started, the agent must appear in azure devops 
![container agent](https://github.com/sbui-axway/docker-apim-packagetools/blob/master/images/container_agent.jpg)
