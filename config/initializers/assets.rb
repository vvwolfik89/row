# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += [
  "wymeditor/lang/ru.js",
  "wymeditor/lang/en.js",
  "custom.scss",
  "custom.js",
  "cocoon_limit_relation.js",
  "refinery/photo_gallery/admin/photo_gallery.css",
  "refinery/photo_gallery/admin/chosen.css",
  "refinery/photo_gallery/admin/photo_gallery.js",
  "refinery/photo_gallery/admin/jquery.chosen.min.js",
  "refinery/photo_gallery/admin/icons/loading.gif",
  "libraries.js"
]
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
