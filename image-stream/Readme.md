```bash



oc login -u admin


build_project=jup
build_name=jupyter-image

oc new-build -n ${build_project} --name ${build_name} $(pwd)

oc start-build ${build_name} -n ${build_project} --from-dir=$(pwd)


oc get is
# Tag image for general use
```
