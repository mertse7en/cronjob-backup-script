#!/bin/bash
# Enter AWS credential to .env file
set -o allexport; source .env; set +o allexport # export .env
bucket="***"
files_location=$HOME/crontab_backup
machine_identifier="****"
now_time=$(date +"%H%M%S")
contentType="application/x-compressed-tar"
dateValue=`date -R`

#s3Key=$s3Key
#s3Secret=$s3Secret

function pushToS3()
{
	files_path=$1
	for file in $files_path*
	do
		fname=$(basename $file)
		resource="/${bucket}/${now_date}/${fname}_${now_time}"
		echo $resource
		stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
		signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | base64`
		curl -X PUT -T "${file}" \
     			-H "Host: ${bucket}.s3.amazonaws.com" \
     			-H "Date: ${dateValue}" \
     			-H "Content-Type: ${contentType}" \
     			-H "Authorization: AWS ${s3Key}:${signature}" \
      			https://${bucket}.s3.amazonaws.com/${now_date}/${fname}_${now_time}
	done
}
pushToS3 $files_location
