class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }

  def average_rating
    if self.reviews.length >0
      rating_array = []
      self.reviews.each do |review|
        rating_array << review.rating
      end
      total = rating_array.inject(:+)
      average_rating = total / self.reviews.length
    else
      average_rating = 0
    end
  end
end
