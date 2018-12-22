#!/bin/bash


app_name=$1
pv_name=${app_name}-pv
pv_dir_name=${app_name}-vol
pv_class_name=${app_name}-storage-class
pv_dir_path=/mnt/data/${pv_dir_name}
pv_cfg_file=pv-cfg-${app_name}.yaml


rm -rf ${pv_dir_path}
mkdir -p ${pv_dir_path}
chcon -Rt svirt_sandbox_file_t ${pv_dir_path}
chmod 777 ${pv_dir_path}

sudo mkdir -p ${pv_dir_path}

cat <<GOPHER > ${pv_cfg_file}
---
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: ${pv_class_name}
provisioner: no-provisioning
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: ${pv_name}
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
    - ReadWriteMany
  persistentVolumeReclaimPolicy: Retain
  storageClassName: ${pv_class_name}
  hostPath:
    path: ${pv_dir_path}
GOPHER

oc apply -f  ${pv_cfg_file}