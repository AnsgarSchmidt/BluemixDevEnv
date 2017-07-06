# BluemixDevEnv
[![Docker Build Statu](https://img.shields.io/docker/build/ansi/bluemixcli.svg)]() 
[![Docker Pulls](https://img.shields.io/docker/pulls/ansi/bluemixcli.svg)]()
[![](https://badge.imagelayers.io/ansi/bluemixcli:latest.svg)]()

Docker container with Bluemix CLI clients installed and configured. So far the container
contains: 

1. Cloudfoundry cf tool
2. Bluemix tool (similar to cf)
3. OpenWisk tool
4. Docker Client configured to use Bluemix container as daemon

## How to start it
In order to be flexible all user specific parts are configured at runtime via environment
variables. 

1. BX_USERNAME **The email used to login to Bluemix**
2. BX_PASSWORD **The password used to login to Bluemix**
3. BX_ORG **Organisation to be preselected**
4. BX_SPACE **Space to be preselected**
5. BX_ACCOUNT_ID **Users Account ID**
6. WSK_ATH **The OpenWhisk authentication token based on org and space**

```
docker run -it --rm                      \
-e BX_USERNAME=<Bluemix Username>        \
-e BX_PASSWORD=<Bluemix Password>        \
-e BX_ORG=<Bluemix Organisation>         \
-e BX_SPACE=<Bluemix Space>              \
-e BX_ACCOUNT_ID=<Bluemix Account ID>    \
-e WSK_AUTH=<Openwhisk Authentification> \
-v ${PWD}:/root/host                     \
ansi/bluemixcli /bin/bash
```

## Where to get the parameters
1. Username and passwd are the normal Bluemix credentials.
2. Org and space are the same as you use inside Bluemix:

![parameter](https://github.com/AnsgarSchmidt/BluemixDevEnv/raw/master/parameters.png)

3. AccountID can be extracted when pressing on "Manage Organisation" and then scoll to the end of the current URL

![accountID](https://github.com/AnsgarSchmidt/BluemixDevEnv/raw/master/accountid.png)

4. Openwhisk auth key is available for the seleted org and space here: https://console.bluemix.net/openwhisk/learn/cli

## Acting within the docker container
Starting the container will start a bash in the "/root" folder. All login and configure options based on the user 
credentials are done by the init.sh script

```
init.sh
```

The host files are located in /root/host and can we used normaly within the docker container. 
