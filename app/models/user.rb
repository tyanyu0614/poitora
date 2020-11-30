class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
        end
        
          validates :password,format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/ }
          validates :password_confirmation,format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/ }
         
end
