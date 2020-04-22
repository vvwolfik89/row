# This migration comes from refinery_sport_rowings (originally 1)
class CreateSportRowingsSportRowings < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_sport_rowings do |t|
      t.string :title
      t.integer :kind
      t.integer :icon_id
      t.text :description
      t.string :short_name
      t.integer :count_athletes
      t.boolean :is_active
      t.integer :position

      t.timestamps
    end

    Refinery::SportRowings::SportRowing.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-sport_rowings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/sport_rowings/sport_rowings"})
    end

    drop_table :refinery_sport_rowings

    Refinery::SportRowings::SportRowing.drop_translation_table!

  end

end
