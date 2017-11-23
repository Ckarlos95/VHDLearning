# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
assets_dir = 'app/assets/**'
assets_extensions = %w{ *.css *.js *.scss *.coffee }

assets_extensions.each do |ext|
  Rails.application.config.assets.precompile += Dir[Rails.root.join(assets_dir, ext)]
end

Rails.application.config.assets.paths += Dir.glob("#{Rails.root}/app/assets/images/**/")