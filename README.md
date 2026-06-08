# Nextcloud Cloudflared

## Setup
Copy and edit sample.env to .env

## Post-install
```sh
# setup data folder
mkdir <DATA_DIR>
chown www-data:www-data <DATA_DIR>

make up

# https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/reverse_proxy_configuration.html
make occ ARGS="config:system:set trusted_domains 1 --value=<DOMAIN>"   # cloudflared domain forwarding
make occ ARGS="config:system:set trusted_proxies 1 --value=<PROXY_IP>" # reverse proxy ip whitelist, check ip at /settings/admin/security
make occ ARGS="config:system:set overwriteprotocol --value=https"      # force https
```
