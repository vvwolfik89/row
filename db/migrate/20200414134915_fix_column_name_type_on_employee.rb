class FixColumnNameTypeOnEmployee < ActiveRecord::Migration[5.1]
  def change
    rename_column :refinery_employees, :type, :employee_type
    add_column :refinery_employees, :beginning_work, :date
    add_column :refinery_employees, :is_active, :boolean, default: true
  end
end
