# Nextcloud Cloudflared

## Setup
Copy and edit sample.env to .env

## Post-install
```
make occ ARGS="config:system:set trusted_domains 1 --value=<DOMAIN>"
make occ ARGS="config:system:set overwriteprotocol --value=https
```
