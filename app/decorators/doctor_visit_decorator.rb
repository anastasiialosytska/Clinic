class DoctorVisitDecorator < Draper::Decorator
  delegate_all

  def doctor_name
    "#{object.doctor.first_name} #{object.doctor.last_name}"
  end

  def doctor_category
    object.doctor.category.name
  end
end
