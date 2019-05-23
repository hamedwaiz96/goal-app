require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "Signing Up Process" do

    describe "GET #new" do

      it "renders the new template" do
        get :new, {}
        expect(response).to render_template("new")
      end
    end

    describe "POST #create" do

      context "invalid params" do

        it "renders the new template again" do
          post :create, params: { "user[email]": "kharhime3@yahoo.com", "user[password]": ""}
          expect(response).to render_template("new")
        end

        it "warns the user that password is invalid" do
          post :create, params: { "user[email]": "kharhime3@yahoo.com", "user[password]": ""}
          expect(flash[:errors]).to be_present
        end
      end

      context "valid params" do

        it "redirects to login page" do
          post :create, params: { "user[email]": "kharhime3@yahoo.com", "user[password]": "goodmorning"}
          expect(response).to redirect_to("/session/new")
        end
      end
    end

  end

end
