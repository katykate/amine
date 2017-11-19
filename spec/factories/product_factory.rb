FactoryBot.define do

  factory :comment do
    user_id 1
    body "Body"
    rating 3
  end

  factory :product do
    name "Test Product"
    description "This is a test description"
    image_url "image.jpg"
    colour "red"
    price 199
  end

end