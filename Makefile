compile_assets:
	@echo 'compiling assets...'
	sass app/views/sass/style.sass --style compressed > public/css/style.css
	haml app/views/index.haml -r ./app/helpers/view_module.rb --style ugly --format html5 > public/index.html

sync_assets:
	@echo 'transfering assets...'
	@if [ -z '$(SERVER)' ]; then echo 'error: SERVER required.'; exit 1; fi
	rsync -rav --delete /www/NickBarth.ca/public/ $(SERVER):/www/NickBarth.ca/

rm_assets:
	@echo 'removing compiled assets...'
	rm public/css/style.css
	rm public/index.html

deploy: compile_assets sync_assets rm_assets
	@echo 'deploy to $(SERVER) complete'
