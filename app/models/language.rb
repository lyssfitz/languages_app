class Language < ApplicationRecord
    has_many :lessons
    has_many :users, through: :user_languages
end
