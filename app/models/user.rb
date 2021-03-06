# frozen_string_literal: true

class User < ApplicationRecord
  include Commentable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(github)
  validates :name, presence: true, length: { maximum: 50 }
  paginates_per 20
  default_scope -> { order(created_at: :desc) }
  has_one_attached :avatar
  has_many :books, dependent: :destroy
  has_many :active_relationships, class_name: "Membership",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name: "Membership",
           foreign_key: "followed_id",
           dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :reports, dependent: :destroy

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_github_oauth(auth, signed_in_resource = nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(provider: auth.provider,
                      uid: auth.uid,
                      name: auth.info.name,
                      email: User.dummy_email(auth),
                      password: Devise.friendly_token[0, 20]
      )
    end
    user.save
    user
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
