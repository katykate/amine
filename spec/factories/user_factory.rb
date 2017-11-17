FactoryBot.define do
	sequence(:email) { |n| "user#{n}@example.com" }
	factory :user do
    email 
    password "1234567890"
    password_confirmation { |u| u.password }
    first_name "Ela"
    last_name "Example"
    admin false
  end
  factory :admin, class: User do
    email
    password "abcdefgh"
    password_confirmation { |u| u.password }
    admin true
    first_name "Admin"
    last_name "User"
  end
end