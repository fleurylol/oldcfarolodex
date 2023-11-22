class DropBusinessFromContacts < ActiveRecord::Migration[7.1]
  def change
    remove_column :contacts, :business
  end
end
