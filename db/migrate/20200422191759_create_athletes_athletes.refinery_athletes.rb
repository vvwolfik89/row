# This migration comes from refinery_athletes (originally 1)
class CreateAthletesAthletes < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_athletes do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.date :bday
      t.integer :type_rowing
      t.string :territorial_unit
      t.string :educational_institution
      t.string :organisation
      t.string :first_organisation
      t.integer :position

      t.timestamps
    end

    Refinery::Athletes::Athlete.create_translation_table! :first_name => :string, :last_name => :string, :patronymic => :string, :territorial_unit => :string, :educational_institution => :string, :organisation => :string, :first_organisation => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-athletes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/athletes/athletes"})
    end

    drop_table :refinery_athletes

    Refinery::Athletes::Athlete.drop_translation_table!

  end

end
