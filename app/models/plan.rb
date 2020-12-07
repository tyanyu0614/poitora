class Plan < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments ,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes 

  with_options presence: true do
    validates :title
    validates :content
    validates :cost ,format: {with: /\A[0-9]+\z/}
  end


  def liked_by?(user)
  likes.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Plan.where('title LIKE(?)', "%#{search}%")
    else
      Plan.all
    end
  end
end
