require 'rails_helper'


describe UsersController, type: :controller do


    let!(:user1) { User.create(email: 'thomas@example.com', password: '1234567890') }
    let!(:user2) { User.create(email: 'percy@example.com', password: '1234567890') }
  
  describe 'GET #show' do

     context 'when a user is logged in' do
      #@user = FactoryBot.build(:user)
      before do
        sign_in user1
      end

        it 'loads correct user details' do
          get :show, params: { id: user1.id }
          expect(response.status).to eq 200
          expect(assigns(:user)).to eq user1
        end

        it 'does not load the second user' do
           get :show, params: { id: user1.id }
           expect(response.status).to eq 200
        end
     end

     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, params: { id: user1.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
  end

end

