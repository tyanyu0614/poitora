class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :comments
         has_many :plans

         # フォロー機能アソシエーション
         # 能動的関係
         has_many :relationships, dependent: :destroy
         has_many :followings, through: :relationships, source: :follow
         # 受動的関係
         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
         has_many :followers, through: :reverse_of_relationships, source: :user

         #いいね機能アソシエーション
         has_many :likes

         with_options presence: true do
          validates :nickname
          validates :password,format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/ }
          validates :password_confirmation,format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/ }
        end

        def liked_by?(plan_id)
          likes.where(plan_id: plan_id).exists?
        end
        
         
          # フォロー機能のメソッド
          def follow(other_user)
            unless self == other_user
              self.relationships.find_or_create_by(follow_id: other_user.id)
            end
          end
        
          def unfollow(other_user)
            relationship = self.relationships.find_by(follow_id: other_user.id)
            relationship.destroy if relationship
          end
        
          def following?(other_user)
            self.followings.include?(other_user)
          end

        end

