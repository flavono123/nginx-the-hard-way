## Prerequisite
- k8s
- curl

## Up the cluster
- recommend to use within another namespace like `nginx`
- `kubectl apply -f nginx.yaml`
- `kubectl apply -f confimaps`

## Test
- `curl -H "Host: <host.to.test>" <expose.service.ip>`

## More labs
- Preparing
