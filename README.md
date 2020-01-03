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
- PUID=1000
- PGID=1000
- TZ=Europe/Prague
