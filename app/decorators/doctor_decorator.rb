# frozen_string_literal: true

class DoctorDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
