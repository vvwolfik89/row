class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :title
      t.string :located
      t.date :start_date
      t.text :description
      t.integer :place
      t.integer :athlete_id
      t.string :locale
    end

    # create_join_table :refinery_athletes, :results do |t|
    #   t.index :refinery_athlete_id
    #   t.index :result_id
    # end

    # create_join_table :refinery_athlete_translations, :results do |t|
    #   t.index :refinery_athlete_translation_id, name: 'athlete_translations_result_id'
    #   t.index :result_id, name: 'result_athlete_translations_id'
    # end
  end
end
