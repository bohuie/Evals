require 'rails_helper'

describe TeamsController, type: :controller do
    include Devise::Test::ControllerHelpers
    
    describe "GET index" do 
        it "Unauthenticated users get a re-direct" do
            get :index
            expect(response).to redirect_to("/users/sign_in")
        end

        it "Authenticated non-admin users get a re-direct" do
            @user = create(:valid_user)
            sign_in @user
            get :index
            expect(response).to redirect_to("/users/sign_in")
        end
    end
end
  