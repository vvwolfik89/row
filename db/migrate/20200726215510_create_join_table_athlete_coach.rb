class CreateJoinTableAthleteCoach < ActiveRecord::Migration[5.1]
  def change
    create_join_table(:refinery_coaches, :refinery_athletes, table_name: :athletes_first_coach) do |t|
      t.index :refinery_athlete_id
      t.index :refinery_coach_id
    end

    create_join_table(:refinery_coaches, :refinery_athletes, table_name: :athletes_current_coach) do |t|
      t.index :refinery_athlete_id
      t.index :refinery_coach_id
    end

    add_column :refinery_athletes, :gender, :integer, default: 0
    add_column :refinery_athletes, :is_active, :boolean, default: false
    add_column :refinery_athletes, :description, :text
    add_column :refinery_athlete_translations, :description, :text
  end
end
