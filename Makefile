build: ## Build a dockerimage
docker-compose build --no-cache

up: ## Start a dockerimage
docker-compose up

drop: ## Drop a dockerimage
docker-compose down

destroy: ## Destroy a dockerimage
docker-compose down --volumes
