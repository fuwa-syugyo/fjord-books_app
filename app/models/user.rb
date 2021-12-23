# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_user_follows, class_name: 'UserFollow',
                                 foreign_key: 'follower_id',
                                 dependent: :destroy,
                                 inverse_of: :follower
  has_many :passive_user_follows, class_name: 'UserFollow',
                                  foreign_key: 'followed_id',
                                  dependent: :destroy,
                                  inverse_of: :followed
  has_many :followings, through: :active_user_follows, source: :followed
  has_many :followers, through: :passive_user_follows, source: :follower

  paginates_per 10

  def follow(other_user)
    followings << other_user
  end

  def unfollow(other_user)
    active_user_follows.find_by!(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
