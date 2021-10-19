#!/bin/sh
kubectl top pod --all-namespaces --use-protocol-buffers | grep -v NAMESPACE | while read line; do echo $line | awk '{print "pod_cpu,container_name="$2 " cpu_total="substr($3, 1, length($3)-1)" " systime()"\n""pod_mem,container_name="$2 " mem_total="substr($4, 1, length($4)-2)" " systime() }'  ; done
