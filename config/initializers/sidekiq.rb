require 'sidekiq'
require 'sidekiq/web'

# For Basic Authentication
Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ['admin', ENV['BASIC_AUTH_PASSWORD'] || 'password']
end
