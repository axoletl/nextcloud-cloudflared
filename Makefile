up:
	docker compose up

down:
	docker compose down

occ:
	docker exec nextcloud-app php occ $(ARGS)
