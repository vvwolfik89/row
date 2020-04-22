class CreatePartnersPartners < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_partners do |t|
      t.string :title
      t.integer :icon_id
      t.text :description
      t.boolean :is_active
      t.string :url_address
      t.integer :position
      t.integer :position

      t.timestamps
    end

    Refinery::Partners::Partner.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-partners"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/partners/partners"})
    end

    drop_table :refinery_partners

    Refinery::Partners::Partner.drop_translation_table!

  end

end
