class AddPhoneNumberIndexToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_index :doctors, :phone_number, unique: true
  end
end
