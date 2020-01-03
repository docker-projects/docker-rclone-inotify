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
