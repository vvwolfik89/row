class CreateEmployeesEmployees < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.integer :employee_type
      t.integer :type_education
      t.string :education
      t.string :phone
      t.date :bdate
      t.text :description
      t.string :position
      t.date :beginning_work_at
      t.integer :icon_id
      t.boolean :is_active
      t.integer :position

      t.timestamps
    end

    Refinery::Employees::Employee.create_translation_table! :first_name => :string, :last_name => :string, :patronymic => :string, :education => :string, :description => :text, :position => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-employees"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/employees/employees"})
    end

    drop_table :refinery_employees

    Refinery::Employees::Employee.drop_translation_table!

  end

end
