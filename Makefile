ifeq (,$(wildcard .env))
$(shell cp .env.example .env)
endif

include .env

devdown:
	docker compose down --remove-orphans

ifeq ($(OS), Windows_NT)

devbuild:
	docker compose build

devup:
	docker compose up -d --remove-orphans

devup-rebuild:
	docker compose up -d --remove-orphans --build

else

devbuild:
	docker compose build

devup:
	docker compose up -d --remove-orphans

devup-rebuild:
	docker compose up -d --remove-orphans --build

devclean:
	@docker rmi $$(docker images -a -q)
	@docker volume rm $$(docker volume ls -q)

endif
