class CreatePreviewsPreviews < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_previews do |t|
      t.string :title
      t.integer :icon_id
      t.text :description
      t.boolean :is_active
      t.integer :position

      t.timestamps
    end

    Refinery::Previews::Preview.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-previews"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/previews/previews"})
    end

    drop_table :refinery_previews

    Refinery::Previews::Preview.drop_translation_table!

  end

end
