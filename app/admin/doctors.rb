# frozen_string_literal: true

ActiveAdmin.register Doctor do
  decorate_with DoctorDecorator

  permit_params :first_name,
                :last_name,
                :phone_number,
                :category_id

  index do
    selectable_column
    column :full_name
    column :phone_number
    column :category
    actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :category
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)

    f.inputs 'Doctor' do
      f.input :first_name
      f.input :last_name
      f.input :phone_number
      f.inputs 'Category' do
        f.input :category, allow_destroy: true do |n_f|
          n_f.input :category_id,
                    as: :select,
                    collection: Category.all
        end
      end
    end

    f.actions
  end
end
