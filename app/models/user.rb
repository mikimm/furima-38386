class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates:nickname, presence: true
         validates:lastname, presence: true
         validates:firstname, presence: true        
         validates:lastname_kana,presence: true  
         validates:firstname_kana,presence: true 
         validates:date_of_birth,presence: true       
         has_many :items
         has_many :orders
end
