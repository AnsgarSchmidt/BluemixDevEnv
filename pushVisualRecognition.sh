#!/usr/bin/env bash

COMMAND="curl -X POST "

for classifiers in `ls -d */`
do
 echo "Work on classifier: ${classifiers}"
 cd ${classifiers}
 for classes in `ls -d */`
 do
  echo "Work on class: ${classes}"
  cd ${classes}
  rm -f *.zip
  mkdir new
  for file in `ls *.jpg`
  do
   convert ${file} -resize 500x500 -quality 100 -auto-orient -auto-level new/${file}
  done
  cd new
  zip -9 ../a.zip *.jpg >/dev/null
  cd ..
  rm -rf new
  cd ..
  if [ ${classes::-1} != "negative" ]
  then
   COMMAND=${COMMAND}" -F ${classes::-1}_positive_examples=@${classifiers}${classes}a.zip"
  else
   COMMAND=${COMMAND}" -F nagative_examples=@${classifiers}${classes}a.zip"
  fi
 done
 cd ..
 COMMAND=${COMMAND}" -F name=${classifiers::-1}"
 COMMAND=${COMMAND}" https://gateway-a.watsonplatform.net/visual-recognition/api/v3/classifiers?api_key=${VISUAL_KEY}&version=2016-05-20"
 ${COMMAND}
 rm `find ./ -name *.zip`
done
