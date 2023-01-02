# frozen_string_literal: true

class RemoveTypeFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :type
  end
end
