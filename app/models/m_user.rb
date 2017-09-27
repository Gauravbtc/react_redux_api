class MUser < ApplicationRecord
  has_many :users, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
 
   def generate_auth_token
   	 token = SecureRandom.hex(10)
   	 return token
   end

end
