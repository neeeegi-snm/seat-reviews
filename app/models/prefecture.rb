class Prefecture < ApplicationRecord
  validates :name, presence: true
  validates :region, presence: true
  
  has_many :reviews
end
