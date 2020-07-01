class AddTypeToCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_coaches, :type_of_staff, :integer
  end
end
