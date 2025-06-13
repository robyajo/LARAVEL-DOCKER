# Makefile untuk manajemen Docker Compose

build:
	docker-compose build -d --no-cache --force-rm

start:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

restart:
	$(MAKE) stop
	$(MAKE) start

logs:
	docker-compose logs -f

ps:
	docker-compose ps

exec-php:
	docker exec -it php_docker sh

exec-db:
	docker exec -it db_docker mysql -uroot -proot

exec-nginx:
	docker exec -it webserver_docker sh

exec-frontend:
	docker exec -it frontend_docker sh

clean:
	docker-compose down -v --remove-orphans
	docker system prune -af --volumes

composer-update:
	docker exec php_docker composer update

composer-install:
	docker exec php_docker composer install

composer-dump-autoload:
	docker exec php_docker composer dump-autoload

data:
	docker exec php_docker php artisan migrate:fresh --seed
	docker exec php_docker php artisan storage:link
	docker exec php_docker php artisan config:cache
