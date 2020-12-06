class Plan < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :title
    validates :content
    validates :cost ,format: {with: /\A[0-9]+\z/}
  end

  def self.search(search)
    if search != ""
      Plan.where('title LIKE(?)', "%#{search}%")
    else
      Plan.all
    end
  end
end
