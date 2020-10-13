class AddPositionToCoachAndEmployee < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_employee_translations, :pre_position, :string
    add_column :refinery_coach_translations, :pre_position, :string
    add_column :refinery_employees, :pre_position, :string
    add_column :refinery_coaches, :pre_position, :string
  end
end
