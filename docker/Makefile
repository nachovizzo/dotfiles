root:
	@docker compose build --no-cache root

run:
	@docker compose run --rm root

user:
	@docker compose build --build-arg CACHEBUST=$(shell date +%s) user

run-user:
	@docker compose run --rm user
