class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end
end
