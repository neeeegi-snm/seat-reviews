class User < ApplicationRecord
  before_save { self.email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  has_many :reviews
  
  has_many :favorites
  has_many :preferings, through: :favorites, source: :review
  
  def like(review)
    self.favorites.find_or_create_by(review_id: review.id)
  end
  
  def unlike(review)
    favorite = self.favorites.find_by(review_id: review.id)
    favorite.destroy if favorite
  end
  
  def favorite?(review)
    self.preferings.include?(review)
  end
end
