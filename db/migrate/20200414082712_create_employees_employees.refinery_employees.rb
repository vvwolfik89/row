# This migration comes from refinery_employees (originally 1)
class CreateEmployeesEmployees < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.integer :type
      t.integer :type_education
      t.string :education
      t.string :phone
      t.date :bdate
      t.integer :photo_id
      t.text :description
      t.integer :position
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-employees"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/employees/employees"})
    end

    drop_table :refinery_employees

  end

end
