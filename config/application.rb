require_relative "boot"

require "rails/all"
require 'boletosimples'
require 'dalli' 
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IntraSin
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version. 
    config.load_defaults 6.1 
    config.i18n.default_locale = :'pt-BR'
    config.active_job.queue_adapter = :sidekiq
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
     
    config.middleware.use Rack::Deflater
    
  end
end

BoletoSimples.configure do |c|
  #c.environment = ENV["BOLETO_SIMPLES_METODO"]
  #c.api_token  = ENV["API_TOKEN"] 
  c.environment = :sandbox
  c.user_agent = 'gust904@gmail.com'
  c.api_token = '-J04vfs8S0jIItnM-RIVJzo1xuhd6guxwOs3FuQZWUM'
  c.cache = ActiveSupport::Cache.lookup_store(:dalli_store, ['localhost:11211'], namespace: 'boletosimples_client', compress: true) 
end