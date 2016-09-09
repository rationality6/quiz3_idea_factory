class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :members, dependent: :destroy

  mount_uploader :image, FileUploader

  def like_for(user)
    likes.find_by_user_id user
  end

  def member_for(user)
    members.find_by_user_id user
  end

end
