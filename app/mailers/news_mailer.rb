class NewsMailer < ActionMailer::Base
  default from: "News@seattlestonesoup.com"

  def newpost(blogpost_id, user_id)
    @blogpost_id = blogpost_id
    @user = User.find(user_id)
    mail(to: "#{@user.email}", subject: "Hey #{@user.username}! New Garden News posted! Check it out!")
  end
end