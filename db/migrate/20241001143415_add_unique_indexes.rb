class AddUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :categories, :name, unique: true
    add_index :doctors, :phone_number, unique: true
    add_index :users, :phone_number, unique: true
  end
end
