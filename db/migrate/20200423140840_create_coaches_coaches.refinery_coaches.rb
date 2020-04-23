# This migration comes from refinery_coaches (originally 1)
class CreateCoachesCoaches < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_coaches do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.date :bday
      t.integer :rowing_type
      t.integer :icon_id
      t.text :description
      t.string :position
      t.integer :position

      t.timestamps
    end

    Refinery::Coaches::Coach.create_translation_table! :first_name => :string, :last_name => :string, :patronymic => :string, :description => :text, :position => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-coaches"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/coaches/coaches"})
    end

    drop_table :refinery_coaches

    Refinery::Coaches::Coach.drop_translation_table!

  end

end
