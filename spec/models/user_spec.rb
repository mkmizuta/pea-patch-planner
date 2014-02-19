require 'spec_helper'

describe User do
  let(:user) {create(:user)}

  describe 'validations' do
    it "is a valid user" do
      expect(user).to be_valid
    end

    it "has a username" do
      user.update(username: nil)

      expect(user.errors[:username]).to_not be_empty
    end

    it "username is unique" do
      user2 = build(:user, username: user.username)
      user2.valid?

      expect(user2.errors[:username]).to_not be_empty
    end

    it "has an email address" do
      user.update(email: nil)

      expect(user.errors[:email]).to_not be_empty
    end


    # hmm... Am I writing the test wrong? Works in app (can't save invalid email and get error message, but spec fails.)   
    it "email is unique" do
      user2 = build(:user, email: user.email)
      user2.valid?
      expect(user2.errors[:email]).to_not be_empty
    end

    it "email address has an @" do
      user.update(email: 'e.com')

      expect(user.errors[:email]).to_not be_empty
    end

    it "has a twitter uid" do
      user.update(uid: nil)

      expect(user.errors[:uid]).to_not be_empty
    end

    it "twitter uid is unique" do
      user2 = build(:user, uid: user.uid)
      user2.valid?

      expect(user2.errors[:uid]).to_not be_empty
    end

    it "twitter uid is a string" do
      user.update(uid: user.uid+"0")

      expect(user.errors[:uid]).to be_empty
    end
  end
end



