Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/1' } # Adjust the Redis URL as needed
  end
  
  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/1' }
  end