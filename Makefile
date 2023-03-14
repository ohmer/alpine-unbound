default:
	docker buildx bake -f docker-bake.hcl

all:
	docker buildx bake -f docker-bake.hcl all

run:
	docker compose up -d

checkconf:
	docker compose exec unbound unbound-checkconf

reload:
	docker compose exec unbound unbound-control reload
