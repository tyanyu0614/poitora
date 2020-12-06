class Comment < ApplicationRecord
  belongs_to :user # usersテーブルとのアソシエーション
  belongs_to :plan # planテーブルとのアソシエーション

end
