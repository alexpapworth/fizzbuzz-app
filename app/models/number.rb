class Number < ApplicationRecord
	has_many :users, through: :favourite
end
