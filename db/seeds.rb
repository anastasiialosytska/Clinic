# frozen_string_literal: true

20.times do
  Doctor.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                category_id: rand(1..8),
                phone_number: "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}",
                password: '123456',
                password_confirmation: '123456')
end
