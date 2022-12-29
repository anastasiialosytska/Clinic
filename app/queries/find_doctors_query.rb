# frozen_string_literal: true

class FindDoctorsQuery
  attr_reader :doctors, :filters

  def initialize(doctors: Doctor.all, filters: {})
    @doctors = doctors
    @filters = filters
  end

  def call
    scope = @doctors
    return scope if filters.empty?

    apply_filter(scope, :category)
  end

  private

  def apply_filter(scope, filter)
    return scope if filters[filter].nil?

    send("filter_by_#{filter}", scope, filters[filter])
  end

  def filter_by_category(scope, value)
    scope.where(category_id: value)
  end
end
