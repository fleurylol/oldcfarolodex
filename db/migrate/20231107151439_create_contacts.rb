class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :guest_name
      t.string :address
      t.string :phone
      t.string :buisness
      t.text :notes
      t.string :user_id

      t.timestamps
    end
  end
end
