class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        with_options presence: true do
          validates :email           
          validates :nickname        
          validates :birthday
        end   
  
        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "Full-width characters"} do
          validates :last_name       
          validates :first_name   
        end
        
        with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" } do
          validates :last_name_kana  
          validates :first_name_kana 
        end
  
        
          validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "include both letters and numbers" }
        

          has_many :items
          has_many :histories

end
