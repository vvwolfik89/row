class AddNationalCoachToCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_coaches, :national_coach, :boolean, default: true
  end
end
