#/bin/bash

cf login -u ${BX_USERNAME} -p ${BX_PASSWORD} -a api.ng.bluemix.net -o ${BX_ORG} -s ${BX_SPACE}

bx login -u ${BX_USERNAME} -p ${BX_PASSWORD} -a api.ng.bluemix.net -o ${BX_ORG} -s ${BX_SPACE} -c ${BX_ACCOUNT_ID}
bx ic init | grep export >> /root/.bx_dockerrc
bx cs init

wsk property set --apihost openwhisk.ng.bluemix.net --auth ${WSK_AUTH}
wsk sdk install docker
wsk sdk install bashauto

. .bx_dockerrc 
docker ps

bx cs cluster-config ${KUB_CLUSTER}

echo "----------------------------------"
echo "-- Please execute these lines   --"
echo "-- In order to set environment  --"
echo "-- variables for the docker     --"
echo "-- client and wsk autocomplete: --"
echo "----------------------------------"
echo ". .bx_dockerrc"
echo ". wsk_cli_bash_completion.sh"
echo ""
