#!/usr/bin/env sh

aws s3 sync s3://resource.malinoskj2.dev /usr/home/jesse/resource 
aws s3 sync /usr/home/jesse/resource s3://resource.malinoskj2.dev
