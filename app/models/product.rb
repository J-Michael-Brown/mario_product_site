class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :description, :presence => true

  def self.reviews(product)
    reviews = []
    sql_reviews = PG.connect({:dbname => "marios_specialty_food_products_development"}).exec("SELECT * FROM reviews WHERE product_id = #{product.id};")
    sql_reviews.each() do |review|
      title = review.fetch("title")
      id = review.fetch("id").to_i()
      description = review.fetch("description")
      rating = review.fetch("rating").to_i
      reviews.push(Book.new({:title => title, :id => id, :description => description, :rating => rating}))
    end
    reviews
  end
end
