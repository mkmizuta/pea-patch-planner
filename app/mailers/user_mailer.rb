class UserMailer < ActionMailer::Base
  default from: "Info@SeattleStoneSoup.com"

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Hi #{@user.username}! Thank you for joining Seattle Stone Soup the Community Garden")
  end

  def newpost(blogpost_id, user_id)
    @blogpost_id = blogpost_id
    @user = User.find(user_id)
    mail(to: "#{@user.email}", subject: "Hey #{@user.username}! New Garden News posted! Check it out!")
  end
end
