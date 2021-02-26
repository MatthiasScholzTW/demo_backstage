node_version := 14.15.2

define npx
  $(eval input=$(1))
  npx --yes --package node@$(node_version) $(input)
endef

# FIXME NOT WORKING without nvm
setup:

	$(call npx, --call @backstage/create-app --version)
	$(call npx, --call @backstage/create-app)

backend-container:
	# FIXME nvm not support in Makefiles
	nvm use 14
	cd scaffolded-app && yarn workspace backend build-image
	docker images | grep backstage

up:
	docker-compose up -d
	docker-compose logs
	open http://localhost:7000

down:
	docker-compose down

restart: down up

logs:
	docker-compose logs -f
