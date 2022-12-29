class UsersController < ApplicationController
  def show
    @user = current_user.decorate
    @categories = Category.all
    @doctors = FindDoctorsQuery.new(filters: filters).call.decorate
    @doctor_visits = current_user.doctor_visits.decorate
  end

  private

  def filters
    params[:filter] ||= {}
    params[:filter].permit(:category)
  end
end
