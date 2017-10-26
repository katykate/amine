class Product < ApplicationRecord
	def self.search(search_term)
		if Rails.env.development?
	  	Product.where("LOWER(name) LIKE ?", "%#{search}%").take
	  else
	  	Product.where("LOWER(name) ilike ?", "%#{search}%").take
		end
	end
end

