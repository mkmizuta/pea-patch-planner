class EmailJob
  @queue = :email
  def self.perform(user_id)
    UserMailer.welcome(user_id).deliver
  end
end