# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  paginates_per 20
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, :title, :memo, :author, presence: true
end
