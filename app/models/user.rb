class User < ApplicationRecord
	has_many :numbers, through: :favourite
	has_many :sessions
end
