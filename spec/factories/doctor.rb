# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    category
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { '111-111-1111' }
    password { Faker::Internet.password }
  end
end
