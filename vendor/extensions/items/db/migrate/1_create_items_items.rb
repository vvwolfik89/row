class CreateItemsItems < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_items do |t|
      t.string :title
      t.datetime :date_start
      t.datetime :date_end
      t.integer :icon_id
      t.text :content
      t.text :description
      t.integer :position
      t.integer :type_news
      t.integer :position

      t.timestamps
    end

    Refinery::Items::Item.create_translation_table! :title => :string, :content => :text, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-items"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/items/items"})
    end

    drop_table :refinery_items

    Refinery::Items::Item.drop_translation_table!

  end

end
