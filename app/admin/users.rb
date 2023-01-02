# frozen_string_literal: true

ActiveAdmin.register User do
  decorate_with UserDecorator

  index do
    column :full_name
    column :phone_number
  end
end
