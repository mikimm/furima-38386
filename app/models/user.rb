class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates:nickname, presence: true
         validates:lastname,format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}, presence: true
         validates:firstname,format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}, presence: true
         validates:lastname_kana,format: { with:/\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}, presence: true
         validates:firstname_kana,format: {  with:/\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}, presence: true
         validates:date_of_birth,presence: true    
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }   
         has_many :items

end
