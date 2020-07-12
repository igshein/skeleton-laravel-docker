setup:
	cp .env.example .env && \
	mkdir .docker/log && \
	mkdir .docker/log/php && \
	chmod -R o+w app/storage && \
	touch .docker/log/php/error.log
	touch .docker/config/mysql/dump/dump.sql

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

restart:
	docker-compose restart

test:
	docker-compose exec php php vendor/bin/codecept run

fix-permissions:
	docker-compose exec php chmod -R o+w storage && chmod -R o+w bootstrap/cache && chmod -R o+w frontend

exec:
	docker-compose exec $(s) bash

clear:
	rm -rf .env && \
	rm -rf .docker/data && \
	rm -rf .docker/log && \
	rm -rf .docker/log/php && \
	rm -rf .docker/log/php/error.log && \
	rm -ff app/.env

clear-cache:
	docker-compose exec php php artisan cache:clear && \
	docker-compose exec php php artisan config:cache && \
	docker-compose exec php php artisan view:clear
