Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://177.200.91.162:6379/0' }
end
 
Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://177.200.91.162:6379/0' }
end