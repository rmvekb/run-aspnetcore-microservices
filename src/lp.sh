#!/bin/bash

declare -A arr
arr[aspnetrunbasics]="30163"
arr[ocelotapigw]="30164"
arr[shoppingaggregator]="30165"
arr[basketapi]="30166"
arr[orderingapi]="30167"
arr[catalogapi]="30168"
arr[discountapi]="30169"
arr[discountgrpc]="30170"
arr[webstatus]="30171"


for n in "${!arr[@]}"
do
  echo "key  : $n"
  echo "value: ${arr[$n]}"



export CI_PROJECT_NAME=$n;
export IMAGE_TAG="ghcr.io/rmvekb/$n:latest";
export NODE_PORT=${arr[$n]};
envsubst < deployment.yaml > $n.deployment.k8s.yaml;
envsubst < service.yaml > $n.service.k8s.yaml;

done
