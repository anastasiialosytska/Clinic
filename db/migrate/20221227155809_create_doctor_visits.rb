class CreateDoctorVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :doctor_visits do |t|
      t.belongs_to :patient
      t.belongs_to :doctor
      t.string :appointment
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
