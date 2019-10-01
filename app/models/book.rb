# frozen_string_literal: true

class Book < ApplicationRecord
  include Commentable
  paginates_per 20
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, :title, :memo, :author, presence: true
  has_one_attached :picture
end
