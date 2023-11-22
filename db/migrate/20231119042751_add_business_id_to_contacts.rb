class AddBusinessIdToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :business_id, :string
  end
end
