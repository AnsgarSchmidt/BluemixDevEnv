#/bin/bash

cf login -u ${BX_USERNAME} -p ${BX_PASSWORD} -a api.ng.bluemix.net -o ${BX_ORG} -s ${BX_SPACE}

bx login -u ${BX_USERNAME} -p ${BX_PASSWORD} -a api.ng.bluemix.net -o ${BX_ORG} -s ${BX_SPACE} -c ${BX_ACCOUNT_ID}
bx ic init | grep export >> /root/.bx_dockerrc

wsk property set --apihost openwhisk.ng.bluemix.net --auth ${WSK_AUTH}
wsk sdk install docker

. .bx_dockerrc 
docker ps

echo "Please execute these lines:"
echo ". .bx_dockerrc"
