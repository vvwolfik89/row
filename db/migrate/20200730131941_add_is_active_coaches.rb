class AddIsActiveCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_coaches, :is_active, :boolean, default: false
  end
end
