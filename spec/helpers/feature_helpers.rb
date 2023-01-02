# frozen_string_literal: true

module FeatureHelpers
  def sign_in(user)
    visit new_doctor_session_path
    fill_in 'Phone number', with: user.phone_number
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end
end
