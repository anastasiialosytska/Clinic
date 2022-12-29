class DoctorVisitsController < ApplicationController
  before_action :find_doctor, only: :create
  before_action :find_doctor_visit, only: %i[show update]
  load_and_authorize_resource

  MAX_OPEN_VISITS = 10

  def show
    @user = @doctor_visit.user.decorate
    @doctor = @doctor_visit.doctor.decorate
  end

  def create
    @doctor_visit = DoctorVisit.new(user_id: current_user.id, doctor_id: @doctor.id)

    if @doctor.doctor_visits.size > MAX_OPEN_VISITS
      flash.now[:alert] = t('.alert', name: @doctor.full_name)
    else
      @doctor_visit.save
      redirect_to @doctor_visit, success: t('.success', name: @doctor.full_name)
    end
  end

  def update
    if @doctor_visit.update(doctor_visit_params)
      redirect_to @doctor_visit.doctor
      @doctor_visit.update(status: 1)
    else
      flash.now[:alert] = t('.alert')
      render :show
    end
  end

  private

  def doctor_visit_params
    params.require(:doctor_visit).permit(:appointment)
  end

  def find_doctor
    @doctor = Doctor.find(params[:doctor_visit][:doctor_id]).decorate
  end

  def find_doctor_visit
    @doctor_visit = DoctorVisit.find(params[:id])
  end
end
