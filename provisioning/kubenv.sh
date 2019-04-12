#!/bin/bash
# SIMPLIFY THE SWITCH BETWEEN ENVS

case $1 in
  pro) CHAIN="%kubenv_pro%";;
  dev) CHAIN="%kubenv_dev%";;
  oat) CHAIN="%kubenv_oat%";;
esac

if [ "$CHAIN" != "" ]
then
        kubectl config use-context $CHAIN
else
        kubectl config current-context
fi
