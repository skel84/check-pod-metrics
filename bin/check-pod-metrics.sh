#!/bin/sh
kubectl top pod --all-namespaces --use-protocol-buffers | grep -v NAMESPACE | while read line; do echo $line | awk '{print $2".pod.cpu "substr($3, 1, length($3)-1)" "systime() "\n"$2".pod.mem "substr($4, 1, length($4)-2)" "systime() }'  ; done
