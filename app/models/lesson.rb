class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments, dependent: :destroy
  has_many :orders
  enum difficulty: { easy:0, intermediate: 1, expert:2 }
  validates :language, :body, :lesson_date, :lesson_time, :street, :city, :state, :postcode, :price, :max_students, :difficulty, presence: true 
  validate :lesson_date_must_not_be_in_the_past, :lesson_date_must_be_within_12_months, :price_must_be_within_range, :lesson_time_must_be_within_timeframe, :max_students_must_be_within_range

  def lesson_date_must_not_be_in_the_past
    if  lesson_date < Date.today
            errors.add(:lesson_date, "must not be in the past")
          end
  end

  def lesson_date_must_be_within_12_months
    if  lesson_date > Date.today.next_year
            errors.add(:lesson_date, "must not be more than 12 months in advance")
          end
  end

  def lesson_time_must_be_within_timeframe
    if lesson_time.present? && !("08:00"..."20:00").include?(lesson_time.strftime("%H:%M"))
      errors.add(:lesson_time, "must be between 08:00 and 20:00")
    end
  end

  def price_must_be_within_range
    unless (10..100).include?(price)
      errors.add(:price, "must be between $10 and $100")
    end
  end

  def max_students_must_be_within_range
    unless (5..30).include?(max_students)
      errors.add(:max_students, "must be between 5 and 30")
    end
  end

end
