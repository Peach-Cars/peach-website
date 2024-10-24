require 'logger'
require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/1' }
  config.error_handlers << proc do |exception, _context|
    Rails.logger.error "Sidekiq job failed with exception: #{exception.message}"
  end

  Sidekiq::Logging.logger = Logger.new(Rails.root.join('log', 'sidekiq.log'))
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/1' }
end
