default:
	docker buildx bake -f docker-bake.hcl

all:
	docker buildx bake -f docker-bake.hcl all

run:
	docker compose up -d

shell:
	docker compose exec unbound with-contenv sh

checkconf:
	docker compose exec unbound unbound-checkconf

reload:
	docker compose exec unbound unbound-control reload
