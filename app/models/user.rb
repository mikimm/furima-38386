class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates:nickname, presence: true
         validates:lastname,format: {with:/\A[ぁ-んァ-ン一-龥]/}
         validates:firstname,format: {with:/\A[ぁ-んァ-ン一-龥]/}
         validates:lastname_kana,format: { with:/\A[ァ-ヶー－]+\z/}
         validates:firstname_kana,format: {  with:/\A[ァ-ヶー－]+\z/}
         validates:date_of_birth,presence: true    
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }   

end
