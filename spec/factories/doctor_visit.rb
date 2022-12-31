# frozen_string_literal: true

FactoryBot.define do
  factory :doctor_visit do
    doctor
    user
    appointment { '' }
  end
end
