class User < ApplicationRecord
	has_many :favourites, :dependent => :destroy 
	has_many :numbers, through: :favourites
	has_many :sessions, :dependent => :destroy

	validates :name, presence: true
end
