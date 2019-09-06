# frozen_string_literal: true

class AddOmniauthColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string

    add_index :users, [:id, :provider], unique: true
  end
end
