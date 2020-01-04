# info
PoC

# usage
```
docker run -d \
--name rcloned \
--restart unless-stopped \
-v /foo/bar/localpath:/localpath \
-e "SOURCE=/localpath" \
-e "BACKEND=mymega" \
-e "BACKEND_PATH=remotepath" \
-e "RCLONE_CONFIG_MYMEGA_TYPE=mega" \
-e "RCLONE_CONFIG_MYMEGA_USER=foobar@example.com" \
-e "RCLONE_CONFIG_MYMEGA_PASS=xxxx" \
lukasmrtvy/docker-rclone-inotify
```
# obfuscate password
```
docker run --rm -it --entrypoint rclone lukasmrtvy/docker-rclone-inotify obscure mypassword
```

# optional 
- -e PUID=1000
- -e PGID=1000
- -e TZ=Europe/Prague
- -e RC_USER=admin
- -e RC_PASS=admin
- -p 5572:5572

# prometheus exporter ( https://github.com/vshn/rclone-exporter )
```
docker run -d \
--name rcloned-prometheus \
-p 8080:8080 \
vshn/rclone-exporter:1.0.0 \
--scrape.url http://admin:admin@rclone-url:5572/
```
