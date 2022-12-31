class DoctorVisit < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :appointment, length: { minimum: 20 }, on: :update

  enum status: {
    open: 0,
    closed: 1
  }

  scope :open, -> { where(status: 0) }
  scope :closed, -> { where(status: 1) }
end
