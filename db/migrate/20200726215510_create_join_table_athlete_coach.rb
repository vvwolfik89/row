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
  end
end
