class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 5000 }
end
