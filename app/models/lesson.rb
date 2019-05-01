class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments
  enum difficulty: {easy: 0, internediate: 1, expert: 2}
end
