require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BookReview
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.generators do |g|
      g.test_framework nil
    end
  end
end
