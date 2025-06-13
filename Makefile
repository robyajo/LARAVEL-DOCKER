# Makefile untuk manajemen Docker Compose

build:
	docker-compose build --no-cache --force-rm

start:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

restart:
	make stop
	make start

logs:
	docker-compose logs -f

ps:
	docker-compose ps

exec-php:
	docker exec -it php_docker sh

exec-db:
	docker exec -it db_docker mysql -u root -p

exec-nginx:
	docker exec -it webserver_docker sh

exec-frontend:
	docker exec -it frontend_docker sh

clean:
	docker-compose down -v --remove-orphans
	docker system prune -f

composer-update:
	docker exec php_docker bash -c "composer update"
composer-install:
	docker exec php_docker bash -c "composer install"
composer-dump-autoload:
	docker exec php_docker bash -c "composer dump-autoload"
data:
	docker exec php_docker bash -c "php artisan migrate:fresh --seed"
	docker exec php_docker bash -c "php artisan storage:link"
	docker exec php_docker bash -c "php artisan config:cache"
	
