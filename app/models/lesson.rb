class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments
  enum difficulty: { easy:0, intermediate: 1, expert:2 }
  validates :language, :body, :lesson_date, :lesson_time, :street, :city, :state, :postcode, :price, :max_students, :difficulty, presence: true
  validate :lesson_date_cannot_be_in_the_past, :price_must_be_within_range
  
  def lesson_date_cannot_be_in_the_past
    if lesson_date.present? && lesson_date < Date.today
            errors.add(:lesson_date, "can't be in the past")
          end
  end

  def price_must_be_within_range
    if price != 10..100
      errors.add(:price, "must be between $10 and $100")
    end
  end

end
