class AddCoastValueToService < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_services, :coast_value, :string
  end
end
