ENV['REDISTOGO_URL'] ||= "redis://username:password@host:6379/"

if Rails.env.development?
  Redis.current = Redis.new
elsif Rails.env.test?
  Redis.current = Redis.new
elsif Rails.env.production?
  uri = URI.parse(ENV["REDISTOGO_URL"])
  Redis.current = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end