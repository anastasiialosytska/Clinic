class Doctor < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         authentication_keys: [:phone_number]

  has_many :doctor_visits, dependent: :destroy
  has_many :users, through: :doctor_visits
  belongs_to :category

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def password_required?
    false
  end
end
