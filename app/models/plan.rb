class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :content
    validates :cost, format: { with: /\A[0-9]+\z/ }
    validates :image
    validates :category_id, numericality: { other_than: 0 }
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def self.search(search)
    if search != ''
      Plan.where('title LIKE(?)', "%#{search}%")
    else
      Plan.all
    end
  end
end
