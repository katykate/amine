require 'rails_helper' # also requires spec_helper and adds other stuff - if didnt need Rails just use spec_helper but unlikely

describe Product do

    context "when the product has comments" do # create context
      before do # before running the test...
        @product = Product.create!(image_url: 'scarf1.jpg', name: "Scarf awesome", description: "I also created this product without using the HTML form!", price: 50, colour: "red")
        @user = FactoryBot.create(:user)
        #@user = User.create(:email => "polo@lolo.com", :password => "123polololo" )
        @product.comments.create!(:rating => 1, :user => @user, :body => "hello")
        @product.comments.create!(:rating => 3, :user => @user, :body => "good")
        @product.comments.create!(:rating => 5, :user => @user, :body => "night")
      end

      it "returns the average rating of all comments" do
        expect(@product.average_rating).to eq 3
      end

    end

end 