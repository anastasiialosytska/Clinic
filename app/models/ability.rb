# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Doctor)
      can :read, DoctorVisit, doctor: user
      can :update, DoctorVisit, doctor: user
    else
      can :read, DoctorVisit, user: user
      can :create, DoctorVisit, user: user
    end
  end
end
