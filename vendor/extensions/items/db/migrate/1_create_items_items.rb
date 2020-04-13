class CreateItemsItems < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_items do |t|
      t.string :title
      t.datetime :date_start
      t.datetime :date_end
      t.integer :photo_id
      t.text :content
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-items"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/items/items"})
    end

    drop_table :refinery_items

  end

end
