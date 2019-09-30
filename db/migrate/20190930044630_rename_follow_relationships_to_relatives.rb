# frozen_string_literal: true

class RenameFollowRelationshipsToRelatives < ActiveRecord::Migration[5.2]
  def change
    rename_table :follow_relationships, :relatives
  end
end
