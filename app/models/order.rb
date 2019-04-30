class Order < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  enum status: { pending: 0, confirmed: 1}
end
