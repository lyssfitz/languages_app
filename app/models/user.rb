class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :lessons
  has_many :users_languages, dependent: :destroy
  has_many :languages, through: :users_languages
  has_many :orders
  has_many :comments
  has_many :ordered_lessons, through: :orders, source: :lesson
  enum gender: {female: 0, male: 1}
  enum role: {student: 0, teacher: 1} 
  has_one_attached :picture
  validates :first_name, :last_name, :date_of_birth, :role, :gender, presence: true
  validate :age_checker
  validates_format_of :first_name, :last_name, with: /^[\A-\z]+$/i, multiline: true, message: "must be a letter"
  before_create :set_default_picture

  private 

  def age_checker
    unless date_of_birth.nil?
      user_age = ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor 
      if user_age < 18
        errors.add(:lesson_date, "You must be over 18 to sign up")
      end
    end
  end

  def set_default_picture
    unless picture.attached?
      picture.attach(io: File.open('app/assets/images/avatar.png'), filename: 'avatar.png', content_type: 'image/png')
    end
  end
  
end