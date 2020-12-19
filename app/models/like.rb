class Like < ApplicationRecord
  belongs_to :user
  belongs_to :plan, counter_cache: :likes_count
end
