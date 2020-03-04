require 'rails_helper'

describe FeedbacksController, type: :controller do
    include Devise::Test::ControllerHelpers
    
    describe "GET index" do 
        it "Unauthenticated users get a re-direct" do
            get :index
            expect(response).to redirect_to("/users/sign_in")
        end
    end

    describe "GET index" do 
        it "Authenticated users get rendered page" do
            @user = create(:valid_user)
            sign_in @user
            get :index
            expect(response).to render_template("index")
        end
    end
end
  