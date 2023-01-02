# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :password, :password_confirmation)
    end
  end
end
