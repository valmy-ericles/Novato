# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.precompile += [/^[-_a-zA-Z0-9]*\..*/]
Rails.application.config.assets.precompile += %w( *.js, *.erb frontend/*.js backoffice/*.js )

Rails.application.config.assets.precompile += %w( company/style.scss )
Rails.application.config.assets.precompile += %w( company/_variables.scss )

Rails.application.config.assets.precompile += %w( user/style.scss )
Rails.application.config.assets.precompile += %w( user/_variables.scss )

Rails.application.config.assets.precompile += %w( entity/style.scss )
Rails.application.config.assets.precompile += %w( entity/_variables.scss )

Rails.application.config.assets.precompile += %w( ckeditor/*)
Rails.application.config.assets.precompile += %w(ckeditor/config.js)

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
