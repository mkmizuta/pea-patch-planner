class NewsJob
  extend HerokuResqueAutoscaler
  @queue = :email
  def self.perform(post_id, user_id)
    UserMailer.newpost(post_id, user_id).deliver
  end
end