class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :lessons
  has_many :users_languages
  has_many :languages, through: :users_languages
  has_many :orders
  has_many :comments
  enum gender: {female: 0, male: 1}
  enum role: {student: 0, teacher: 1} 
  has_one_attached :picture
  validates :first_name, :last_name, :date_of_birth, :role, :languages, presence: true

  
end