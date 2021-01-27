class Review < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  
  validates :theater, presence: true, length: { maximum: 50 }
  validates :seat, presence: true, length: { maximum: 50 }
  validates :program, presence: true
  validates :content, presence:true
end
