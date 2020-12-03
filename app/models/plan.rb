class Plan < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :content
    validates :cost
  end
end
