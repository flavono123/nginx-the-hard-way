## Prerequisite
- k8s
- curl

## Up the cluster
- recommend to use within another namespace like `nginx`
- `kubectl apply -f nginx.yaml`
- `kubectl apply -f confimaps`

## Labs
### Server selection
```sh
# curl -H "Host: <host.to.test>" <expose.service.ip>:30080
$ curl -H "Host: www.example.com" 192.168.x.x:30080
$ curl -H "Host: host1.example.com" 192.168.x.x:30080
$ curl -H "Host: www.exmaple.com" 192.168.x.x:30080 # notice the typo
$ curl -H "Host: www.example.org" 192.168.x.x:30080
$ curl -H "Host: subdomain.example.com" 192.168.x.x:30080
...
```

### Jump location block
```sh
# curl -H "Host: jump.com" <expose.service.ip>:30080 

# 1. Never fallback to /usr/share/nginx/html/jump/fallback/index.html (9de3e97)
# curl -H "Host: jump.com" <expose.service.ip>:30080/not_exists_file
$ curl -H "Host: jump.com" 192.168.x.x:30080/blahblah
...

# 2. rewrite ... last makes jump (a51b853)
# curl -H "Host: jump.com" 192.168.x.x:30080/rewriteme/<exist_or_not>
$ curl -H "Host: jump.com" 192.168.x.x:30080/rewriteme/blah
$ curl -H "Host: jump.com" 192.168.64.2:30080/rewriteme/index
...

# 3. Never fallback to /usr/share/nginx/html/jump/fallback/whoops.html (28386e5)
# error_page cause internal redirect
# curl -H "Host: jump.com" <expose.service.ip>:30080/not_exists_file
$ curl -H "Host: jump.com" 192.168.x.x:30080/blahblah
```

## Ref
- https://www.digitalocean.com/community/tutorials/understanding-the-nginx-configuration-file-structure-and-configuration-contexts
- https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms
## More labs
- Preparing
