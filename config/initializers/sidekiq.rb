require 'sidekiq'
require 'sidekiq/web'

# For Basic Authentication
Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ['admin', ENV['BASIC_AUTH_PASSWORD'] || 'password']
end

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_SERVER_HOSTNAME']}:#{ENV['REDIS_SERVER_PORT']}/0" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_SERVER_HOSTNAME']}:#{ENV['REDIS_SERVER_PORT']}/0" }
end
