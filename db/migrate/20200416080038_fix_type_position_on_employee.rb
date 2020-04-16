class FixTypePositionOnEmployee < ActiveRecord::Migration[5.1]
  def up
    change_column :refinery_employees, :position, :string
  end

  def down
    change_column :refinery_employees, :position, :integer, using: 'position::integer'
  end
end
