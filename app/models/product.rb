class Product < ApplicationRecord
	has_many :orders
	has_many :comments
	validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
	validates :name, presence: true
	validates :rating, numericality: { only_integer: true }
	def highest_rating_comment
  	comments.rating_desc.first
	end
	def average_rating
  comments.average(:rating).to_f
	end
	def self.search(search_term)
		if Rails.env.development?
	  	Product.where("name LIKE ?", "%#{search_term}%").take
	  else
	  	Product.where("name ilike ?", "%#{search_term}%").take
		end
	end
end

