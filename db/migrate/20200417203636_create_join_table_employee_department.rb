class CreateJoinTableEmployeeDepartment < ActiveRecord::Migration[5.1]
  def change
    create_join_table :refinery_employees, :refinery_departments do |t|
      t.index :refinery_employee_id
      t.index :refinery_department_id
    end
  end
end
