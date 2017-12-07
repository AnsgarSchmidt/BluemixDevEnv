#!/usr/bin/env bash

cf login -u ${BX_USERNAME} -p ${BX_PASSWORD} -a api.ng.bluemix.net -o ${BX_ORG} -s ${BX_SPACE}

bx login -u ${BX_USERNAME} -p ${BX_PASSWORD} -a api.ng.bluemix.net -o ${BX_ORG} -s ${BX_SPACE} -c ${BX_ACCOUNT_ID}

wsk property set --apihost openwhisk.ng.bluemix.net --auth ${WSK_AUTH}
wsk sdk install docker
wsk sdk install bashauto

bx cs init
bx cs cluster-config ${KUB_CLUSTER}
