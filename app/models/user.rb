class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lessons
  has_many :lessons, through: :user_languages
  has_many :orders
  has_many :comments
  enum gender: {female: 0, male: 1}
  enum role: {student: 0, teacher: 1} 
end