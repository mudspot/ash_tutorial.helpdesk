stop:
	docker-compose down --remove-orphans

devd: stop
	STAGE=dev docker-compose up --build -d

psql:
	docker-compose exec db psql -U postgres -d ash
