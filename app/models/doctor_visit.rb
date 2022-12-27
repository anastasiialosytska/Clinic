class DoctorVisit < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  enum status: {
    open: 0,
    closed: 1
  }
end
