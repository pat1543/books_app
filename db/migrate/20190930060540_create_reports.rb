# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :reports, [:user_id, :created_at]
  end
end
