# frozen_string_literal: true

class AddColumnToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_id, :integer
  end
end
