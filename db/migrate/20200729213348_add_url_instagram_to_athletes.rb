class AddUrlInstagramToAthletes < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_athletes, :url_instagram, :string
  end
end
