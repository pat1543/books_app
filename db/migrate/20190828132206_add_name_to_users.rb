# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :introduction, :text
  end
end
