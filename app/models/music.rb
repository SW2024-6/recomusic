class Music < ApplicationRecord
  has_many :comments
  has_one :link
end
