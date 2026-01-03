.PHONY: infra-up infra-down schema-update atlas-hash atlas-gen-schema

infra-up:
	docker compose up -d
	atlas migrate apply --env local

infra-down:
	docker compose down

schema-update: atlas-hash atlas-gen-schema
	@echo "migration updated"

atlas-hash:
	atlas migrate hash

atlas-gen-schema:
	atlas schema inspect --env local --url "file://migrations" --format '{{ sql . }}' > schema/schema.sql
