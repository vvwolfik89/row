class CreateDataEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :data_emails do |t|
      t.string :email
      t.text :text, limit: 65535
      t.string :address
      t.integer :type_of_email
      t.string :unp
      t.string :name
      t.timestamps
    end
  end
end
