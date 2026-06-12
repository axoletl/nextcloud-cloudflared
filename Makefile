up:
	docker compose up

down:
	docker compose down

occ:
	docker exec -it --user www-data nextcloud-app php occ $(ARGS)

exec:
	docker exec -it nextcloud-app sh -c $(CMD)
