require 'rails_helper'

describe WelcomeController, type: :controller do
    include Devise::TestHelpers
    
    describe "GET index" do 
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end
    end
end
  