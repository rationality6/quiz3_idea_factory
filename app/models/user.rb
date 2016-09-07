class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_messages, through: :likes, source: :post

  has_many :members, dependent: :destroy
  has_many :memberd_messages, through: :members, source: :post

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end
end
