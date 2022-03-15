#!/bin/bash

tmp=$(mktemp)
echo "* Deployment spec template" > "${tmp}"
echo "volumeMounts:" >> "${tmp}"
echo "  - name: nginxconf
    mountPath: /etc/nginx/conf.d" >> "${tmp}"

ls -1 html/ | tr -d "_" | xargs -I{} echo "  - name: {}htmls
    mountPath: /usr/share/nginx/html/{}" >> "${tmp}"

echo "volumes:" >> "${tmp}"

echo "  - name: nginxconf
    configMap:
      name: nginxconf" >> "${tmp}"

ls -1  html/ | tr -d "_" | xargs -I{} echo "  - name: {}htmls
    configMap:
      name: {}htmls" >> "${tmp}"

cat "${tmp}"
rm "${tmp}"

