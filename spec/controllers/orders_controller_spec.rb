require 'rails_helper'

describe OrdersController, type: :controller do
  context 'GET #index' do
    before do
      @user1 = FactoryBot.create(:admin)
      @user2 = FactoryBot.create(:user)
    end

    it "allows admin to view page" do
      sign_in(@user1)
      get :index
      expect(response).to have_http_status(200)   
      
    end
  end

end
