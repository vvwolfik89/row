# This migration comes from refinery_photo_gallery (originally 20130127175559)
class AddUrlToPhotos < ActiveRecord::Migration[4.2]
  def change
    add_column :refinery_photo_gallery_photos, :url, :string
  end
end
