class User < ApplicationRecord
  # ホストかどうかを判定
  def host?
    role == 'host'
  end
  
  def user?
    role == 'user'
  end
  
  validates :uid, presence: true, uniqueness: true
  validates :pass, presence: true, length: { minimum: 6 }
  validates :history, presence: true
  validates :practice, numericality: { greater_than_or_equal_to: 0 }

  has_many :comments
end
