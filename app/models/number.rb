class Number < ApplicationRecord
	has_many :favourites
	has_many :users, through: :favourites

	validates :result, presence: true, allow_blank: true
end
