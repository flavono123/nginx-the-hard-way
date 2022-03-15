## Prerequisite
- k8s

## Up the cluster
- `sh update_cm.sh`
- `kubectl apply -f nginx.yaml`
- or `kubectl rollout restart deploy nginx` to update configmaps

## Labs
- index(wip)
- try_files: `curl -H "Host: jump.com" 192.168.64.2:30080/blahblah` (remove `error_page` directive)
- rewrite(wip)
- error_page: `curl -H "Host: jump.com" 192.168.64.2:30080/blahblah`

## Ref
- https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms

