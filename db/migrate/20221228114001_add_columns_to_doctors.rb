# frozen_string_literal: true

class AddColumnsToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :first_name, :string, null: false
    add_column :doctors, :last_name, :string, null: false
    add_column :doctors, :phone_number, :string, null: false
  end
end
