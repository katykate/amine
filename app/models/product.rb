class Product < ApplicationRecord
	def self.search(search_term)
		if Rails.env.development?
	  	Product.where("LOWER(name) LIKE ?", "%#{name.downcase}%").take
	  else
	  	Product.where("LOWER(name) ILIKE ?", "%#{name}%").take
		end
	end
end

