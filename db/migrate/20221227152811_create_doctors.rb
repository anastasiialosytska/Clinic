class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :full_name, null: false
      t.string :phone_number, null: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
