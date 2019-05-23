require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do

    subject(:user) { FactoryBot.build(:user, :email => "kharhime3@yahoo.com", :password => "goodmorning")}

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    describe "#is_password?" do

      it "should check the password of User" do
        expect(user.is_password?("goodmorning")).to eq(true)
      end
    end

    describe "#reset_session_token!" do
      before(:each) { user.save! }

      it "should return the session_token" do
        a = user.reset_session_token!
        expect(a).to eq(user.session_token)
      end

      it "should create a new session_token" do
        a = user.reset_session_token!
        b = user.reset_session_token!
        expect(a).not_to eq(b)
      end
    end

    describe "::find_by_credentials" do
      before(:each) { user.save! }

      context "user info is correct" do

        it "returns the user" do
          expect(User.find_by_credentials("kharhime3@yahoo.com", "goodmorning")).to be_kind_of(User)
        end
      end

      context "user info is incorrect" do

        it "doesn't return the user" do
          expect(User.find_by_credentials("kharhime2@yahoo.com", "ghul")).not_to be_kind_of(User)
        end
      end
    end

  end
end
