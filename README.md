# jupyter-analytics

## Create PV

```bash
# 0. Copy  current pv_create.sh to /tmp  on openshift box
# 1.  ssh as root to openshift box

/tmp/pv_create.sh jupyter 
```

## OpenShift Run

```
oc login
oc new-project jup

oc create -f  oc-dep-jupyter.yaml




```

## Reclaim pv

```bash

# 1.  ssh as root to openshift box
rm -rf /mnt/data/jupyter-vol/*

# 2. Reclaim PV
oc login -u admin
oc patch pv/jupyter-pv --type json -p $'- op: remove\n  path: /spec/claimRef'

```
