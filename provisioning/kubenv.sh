#!/bin/bash
# SIMPLIFY THE SWITCH BETWEEN ENVS

case $1 in
  pro) CHAIN="arn:aws:eks:eu-west-1:717170762493:cluster/softwarefactory-pro";;
  dev) CHAIN="arn:aws:eks:eu-west-1:176806391229:cluster/softwarefactory-dev";;
  oat) CHAIN="arn:aws:eks:eu-west-1:094242746997:cluster/softwarefactory-oat";;
esac

if [ "$CHAIN" != "" ]
then
        kubectl config use-context $CHAIN
else
        kubectl config current-context
fi
