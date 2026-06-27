# Nextcloud Cloudflared

## Setup
Copy and edit sample.env to .env

## Post-install
```sh
# setup data folder
mkdir <DATA_DIR>
chown www-data:www-data <DATA_DIR>

# start container
make up

# https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/reverse_proxy_configuration.html
make occ ARGS="config:system:set trusted_domains 1 --value=<DOMAIN>"   # cloudflared domain forwarding
make occ ARGS="config:system:set trusted_domains 2 --value=<LOCAL_IP>" # local access
make occ ARGS="config:system:set trusted_proxies 1 --value=<PROXY_IP>" # reverse proxy ip whitelist, check ip at /settings/admin/security
make occ ARGS="config:system:set overwriteprotocol --value=https"      # force https

# https://docs.nextcloud.com/server/stable/admin_manual/configuration_server/config_sample_php_parameters.html
make occ ARGS="config:system:set enabledPreviewProviders 0 --value='OC\Preview\Movie'"
make occ ARGS="config:system:set enabledPreviewProviders 1 --value='OC\Preview\MP4'"
make occ ARGS="config:system:set enabledPreviewProviders 2 --value='OC\Preview\AVI'"
make occ ARGS="config:system:set enabledPreviewProviders 3 --value='OC\Preview\PNG'"
make occ ARGS="config:system:set enabledPreviewProviders 4 --value='OC\Preview\JPEG'"
make occ ARGS="config:system:set enabledPreviewProviders 5 --value='OC\Preview\GIF'"
make occ ARGS="config:system:set enabledPreviewProviders 6 --value='OC\Preview\BMP'"
make occ ARGS="config:system:set enabledPreviewProviders 7 --value='OC\Preview\XBitmap'"
make occ ARGS="config:system:set enabledPreviewProviders 8 --value='OC\Preview\MP3'"
make occ ARGS="config:system:set enabledPreviewProviders 9 --value='OC\Preview\TXT'"
make occ ARGS="config:system:set enabledPreviewProviders 10 --value='OC\Preview\MarkDown'"
make occ ARGS="config:system:set enabledPreviewProviders 11 --value='OC\Preview\PDF'"

make exec CMD="apt update"
make exec CMD="apt install ffmpeg imagemagick ghostscript"
```

## TODO
- Move post-install into script or Dockerfile
