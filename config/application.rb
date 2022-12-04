require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Clinic
  class Application < Rails::Application
    config.load_defaults 6.1
    config.autoload_paths << "#{config.root}/app/presenters"
    config.eager_load_paths << Rails.root.join('app/presenters')
  end
end
