class CreateServicesServices < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_services do |t|
      t.string :title
      t.integer :kind
      t.integer :icon_id
      t.text :description
      t.string :short_name
      t.integer :coast
      t.boolean :show_inline
      t.boolean :is_active
      t.integer :position

      t.timestamps
    end

    Refinery::Services::Service.create_translation_table! :title => :string, :description => :text, :coast => :integer

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-services"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/services/services"})
    end

    drop_table :refinery_services

    Refinery::Services::Service.drop_translation_table!

  end

end
