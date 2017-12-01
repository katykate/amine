class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  after_save :clear_cache

  def clear_cache
    $redis.del "orders"
  end
  
end

