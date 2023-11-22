class FixSpellingOfBusiness < ActiveRecord::Migration[7.1]
  def change
    rename_column :contacts, :buisness, :business
  end
end
