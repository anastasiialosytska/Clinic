class Doctor < ApplicationRecord
  has_many :doctor_visits, dependent: :destroy
  has_many :users, through: :doctor_visits
  belongs_to :category

  validates :full_name, presence: true
end
