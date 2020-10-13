class RemovePositionEmployeeTranslationsAndCoach < ActiveRecord::Migration[5.1]
  def up
    remove_column :refinery_coach_translations, :position
    remove_column :refinery_employee_translations, :position
  end

  def down
    add_column :refinery_coach_translations, :position, :string
    add_column :refinery_employee_translations, :position, :string
  end
end
