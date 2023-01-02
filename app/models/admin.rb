# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         authentication_keys: [:email]
end
