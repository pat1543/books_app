# frozen_string_literal: true

class Relative < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, :followed_id, presence: true
end
