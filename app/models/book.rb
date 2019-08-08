# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :memo, :author, presence: true
  mount_uploader :picture, PictureUploader
end
