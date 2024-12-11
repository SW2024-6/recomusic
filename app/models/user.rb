class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates :pass, presence: true, length: { minimum: 6 }
  validates :history, presence: true
  validates :practice, numericality: { greater_than_or_equal_to: 0 }
end
