# config/initializers/redis.rb

require 'redis'

RedisClient = Redis.new(url: ENV['REDIS_URL'] || 'redis://localhost:6379/1')
