require 'spec_helper'

describe Blogpost do
  let(:admin) {create(:blog)}
  describe "validates" do

    it "is valid" do
      expect(blog).to be_valid
    end

    it "is invalid without a title" do
      expect(Blog.new(title: nil)).to have(1).error_on(:title)
    end

    it "is invalid without a body" do
      expect(Blog.new(post_text: nil)).to have(1).error_on(:post_text)
    end

    it "is invalid without a user id" do
      expect(List.new(user_id: nil)).to have(1).error_on(:user_id)
    end
  end
end
