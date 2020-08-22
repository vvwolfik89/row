class CreateCompetitionsCompetitions < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_competitions do |t|
      t.string :title
      t.text :description
      t.integer :image_id
      t.integer :type_of_competition
      t.integer :location
      t.date :date_of_competition
      t.string :country
      t.string :city
      t.integer :position

      t.timestamps
    end

    Refinery::Competitions::Competition.create_translation_table! :title => :string, :description => :text, :country => :string, :city => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-competitions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/competitions/competitions"})
    end

    drop_table :refinery_competitions

    Refinery::Competitions::Competition.drop_translation_table!

  end

end
