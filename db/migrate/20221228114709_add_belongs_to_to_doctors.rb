# frozen_string_literal: true

class AddBelongsToToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :doctor_visits, :user
    remove_reference :doctor_visits, :patient
  end
end
