#!/bin/sh

vm=docker1

docker-machine start $vm &> /dev/null &&
eval $(docker-machine env $vm) &> /dev/null 
      	
