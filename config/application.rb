require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Elevatorsrails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

<<<<<<< HEAD
    config.assets.paths << Rails.root.join('.app/assets/javascripts/plugins')
    # config.assets.paths << Rails.root.join('.app/assets/stylesheets/plugins')
=======
    # config.assets.paths << Rails.root.join('.app/assets/javascripts/plugins')
>>>>>>> 7a042860af5c1d8ed1a322a3763b2cb39455789e
    # config.assets.paths << Rails.root.join("app", "assets", "javascripts", "plugins", "slider.revolution", "js")
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
