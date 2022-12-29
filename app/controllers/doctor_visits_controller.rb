class DoctorVisitsController < ApplicationController
  before_action :find_doctor, only: :create
  before_action :find_doctor_visit, only: :show

  MAX_OPEN_VISITS = 10

  def show
    @user = @doctor_visit.user.decorate
    @doctor = @doctor_visit.doctor.decorate
  end

  def create
    @doctor_visit = DoctorVisit.new(user_id: current_user.id, doctor_id: @doctor.id)

    return flash.now[:alert] = "There are no vacancies for the doctor #{@doctor.full_name}" if @doctor.doctor_visits.size > MAX_OPEN_VISITS

    @doctor_visit.save
    redirect_to @doctor_visit, success: "You have successfully registered with a doctor #{@doctor.full_name}"
  end

  private

  def find_doctor
    @doctor = Doctor.find(params[:doctor_id]).decorate
  end

  def find_doctor_visit
    @doctor_visit = DoctorVisit.find(params[:id])
  end
end
