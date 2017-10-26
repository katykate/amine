class Product < ApplicationRecord
	def self.search(search_term)
		if Rails.env.production?
	  	Product.where("LOWER(name) LIKE ?", "%#{search_term}%").take
	  else
	  	Product.where("LOWER(name) ilike ?", "%#{search_term}%").take
		end
	end
end

