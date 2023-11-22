class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :user_id

      t.timestamps
    end
  end
end
