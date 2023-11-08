class AddNotesToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :notes, :text
  end
end
