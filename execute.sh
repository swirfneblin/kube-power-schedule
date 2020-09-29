#!/bin/sh

eval "$(kubectl get deployment -A -o custom-columns=name:.metadata.name,namespace:.metadata.namespace | tail -n +2 | awk -F' ' '{ print  "kubectl scale deployment --replicas=$REPLICAS  "$1" -n "$2 }')"