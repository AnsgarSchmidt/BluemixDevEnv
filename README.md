# BluemixDevEnv
Docker container with Bluemix CLI clients installed and configured. So far the container
contains 
1. Cloudfoundry cf tool
2. Bluemix tool (similar to cf)
3. OpenWisk tool
4. Docker Client configured to use Bluemix container as daemon

## How to start it
In order to be flexible all user specific parts are configured at runtime via environment
variables. 

1. BX_USERNAME *The email used to login to Bluemix*
2. BX_PASSWORD *The password used to login to Bluemix*
3. BX_ORG *Organisation to be preselected*
4. BX_SPACE *Space to be preselected*
5. BX_ACCOUNT_ID *Users Account ID*
6. WSK_ATH *The OpenWhisk authentication token based on org and space*

docker run -it --rm                        \
-e BX_USERNAME=**Bluemix Username**        \
-e BX_PASSWORD=**Bluemix Password**        \
-e BX_ORG=**Bluemix Organisation**         \
-e BX_SPACE=**Bluemix Space**              \
-e BX_ACCOUNT_ID=**Bluemix Account ID**    \
-e WSK_AUTH=**Openwhisk Authentification** \
ansi/bluemixcli /bin/bash

## Where to get the parameters

![parameter] parameters.png

![accountID] accountid.png

 
