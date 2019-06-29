class User < ApplicationRecord
	has_many :numbers, through: :favourite
end
