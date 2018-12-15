class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :description, :presence => true

  def rating
    reviews = self.reviews
    if reviews.any?
      average = 0
      reviews.each do |review|
        average += review.rating
      end
      return (10*average/reviews.length).to_f/10
    else
      false
    end
  end
end
