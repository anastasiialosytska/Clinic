# frozen_string_literal: true

module ApplicationHelper
  def current_auth_resource
    doctor_signed_in? ? current_doctor : current_user
  end

  def current_ability
    @current_ability or @current_ability = Ability.new(current_auth_resource)
  end
end
