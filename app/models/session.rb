class Session < ApplicationRecord
  belongs_to :user

  validates :auth_token, presence: true
  validates_uniqueness_of :auth_token
end
