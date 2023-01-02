# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         authentication_keys: [:phone_number]

  has_many :doctor_visits, dependent: :destroy
  has_many :doctors, through: :doctor_visits

  PHONE_NUMBER_REGEXP = /\A\d{3}-\d{3}-\d{4}\z/.freeze

  validates :first_name, :last_name, presence: true
  validates :phone_number, presence: true, format: { with: PHONE_NUMBER_REGEXP }, uniqueness: true

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
