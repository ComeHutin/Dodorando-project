# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join("lib")

Rails.application.config.assets.paths << Rails.root.join("vendor")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( infobox.min.js )
Rails.application.config.assets.precompile += %w( markerclusterer.js )
Rails.application.config.assets.precompile += %w( jquery-2.2.0.min.js )
Rails.application.config.assets.precompile += %w( mmenu.min.js)

Rails.application.config.assets.precompile += %w( maps.js )
Rails.application.config.assets.precompile += %w( chosen.min.js )
Rails.application.config.assets.precompile += %w( slick.min.js )
Rails.application.config.assets.precompile += %w( rangeslider.min.js
)
Rails.application.config.assets.precompile += %w( magnific-popup.min.js )
Rails.application.config.assets.precompile += %w( waypoints.min.js )
Rails.application.config.assets.precompile += %w( counterup.min.js )
Rails.application.config.assets.precompile += %w( jquery-ui.min.js)

Rails.application.config.assets.precompile += %w( tooltips.min.js)

Rails.application.config.assets.precompile += %w( custom.js)

