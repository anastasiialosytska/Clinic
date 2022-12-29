class DoctorsController < ApplicationController
  before_action :authenticate_doctor!

  def show
    @doctor = current_doctor.decorate
    @current_doctor_visits = current_doctor.doctor_visits.where(status: 0).decorate
    @closed_doctor_visits = current_doctor.doctor_visits.where(status: 1).decorate
  end
end
