class User < ApplicationRecord
  has_many :doctor_visits, dependent: :destroy
  has_many :doctors, through: :doctor_visits
end
