class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, -> { where(status: true) }, foreign_key: :user_id, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :friend_requests, -> { where(status: false) }, class_name: "Friendship", foreign_key: :friend_id, dependent: :destroy
  has_many :enqueued_friends, through: :friend_requests, source: :user

  has_many :posts, foreign_key: :author_id, dependent: :destroy

  has_many :likings, dependent: :destroy
  has_many :liked_posts, through: :likings, source: :post

  has_many :comments, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4 }

  def send_request_to(user)
    request = Friendship.create(user: self, friend: user)
    user.friend_requests << request
  end

  def delete_friend(user)
    Friendship.find_by(user: self, friend: user).destroy
    Friendship.find_by(user: user, friend: self).destroy
  end
end
