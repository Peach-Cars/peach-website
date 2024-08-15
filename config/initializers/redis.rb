# config/initializers/redis.rb

require 'redis'

RedisClient = Redis.new(url: ENV.fetch('REDIS_URL') { 'redis://localhost:6379/1' }) unless defined?(RedisClient)
