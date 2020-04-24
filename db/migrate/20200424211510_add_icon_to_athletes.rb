class AddIconToAthletes < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_athletes, :icon_id, :integer
    rename_column :refinery_athletes, :type_rowing, :rowing_type
  end
end
