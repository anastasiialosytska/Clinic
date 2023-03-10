# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :name

  index do
    column :name
    actions
  end
end
