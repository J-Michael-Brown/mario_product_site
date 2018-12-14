class Review < ActiveRecord::Base
  belongs_to :product

  validates_inclusion_of :rating, :in => (1..5).to_a
  validates :content_body, :presence => true
end
