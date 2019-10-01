# frozen_string_literal: true

class RenameRelativesToMembership < ActiveRecord::Migration[5.2]
  def change
    rename_table :relatives, :memberships
  end
end
