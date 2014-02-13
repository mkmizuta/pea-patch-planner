require 'spec_helper'

describe Blogpost do
  let(:user) {create(:blogpost)}
  describe "validates" do

    it "is valid with title, post_text and user_id " do
      blogpost = Blogpost.new(
      title: 'Title',
      post_text: 'Blah, Blah, Blah carrots',
      user_id: 'Bobthefarmer')
      expect(blogpost).to be_valid
    end

    it "is invalid without a title" do
      expect(Blogpost.new(title: nil)).to have(1).error_on(:title)
    end

    it "is invalid without a post text" do
      expect(Blogpost.new(post_text: nil)).to have(1).error_on(:post_text)
    end

    it "is invalid without a user id" do
      expect(Blogpost.new(user_id: nil)).to have(1).error_on(:user_id)
    end
  end
end
