class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments
  enum difficulty: { easy:0, intermediate: 1, expert:2 }
  validates :language, :body, :lesson_date, :lesson_time, :street, :city, :state, :postcode, :price, :max_students, :difficulty, presence: true
end
