#!/bin/bash

# Nginx conf
options=$(ls -1 conf.d/ | xargs -I{} echo "--from-file=conf.d/{}" | tr "\n" " ")
kubectl -n nginx create cm nginxconf $options --dry-run=client -o yaml > configmaps/nginxconf.yaml

# HTMLs
for dir in $(ls html/)
do
  options=$(ls -1 html/$dir | xargs -I{} echo "--from-file=html/$dir/{}" | tr "\n" " ")
  cm="$(echo "$dir" | tr -d "_")htmls"
  echo $cm
  kubectl -n nginx create cm "${cm}" $options --dry-run=client -o yaml > configmaps/"${cm}.yaml"
done

kubectl apply -f configmaps
