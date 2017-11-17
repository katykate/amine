require "rails_helper"

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe User do

	before(:each) do
	 	@user = User.create!(first_name: "Adam", last_name: "Krawczyk", email: "xxx@gmail.com", password: "abcdefgh", password_confirmation: "abcdefgh")
	end

	describe "creation" do
	 	it "should have one user created after being created" do
	 		expect(User.all.count).to eq(1)
	 	end
	end

	describe "validations" do	
	 	it "should not let user be created without an email" do
	 		@user.email = nil
	 		expect(@user).to_not be_valid
	 	end
	end

end



#describe User, type: :model do

	#it "should not validate users without an email address" do
    #@user = FactoryBot.build(:user, email: "not_an_email")
    #expect(@user).to_not be_valid
  #end

	#before(:each) do
	 	#@user = User.create!(first_name: "Adam", last_name: "Krawczyk", email: "xxx@gmail.com", password: "abcdefgh", password_confirmation: "abcdefgh")
	#end

	#describe "creation" do
		#@user = FactoryBot.build(:user)
	 	#it "should have one user created after being created" do
	 		#expect(User.all.count).to eq(1)
	 	#end
	#end

	#describe "validations" do	
	 	#it "should not let user be created without an email" do
	 		#@user.email = nil
	 		#expect(@user).to_not be_valid
	 	#end
	#end

#end