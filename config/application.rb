# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PsychoWarfareWebsite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.active_job.queue_adapter = :sidekiq

    # These settings are for the sending out email for active admin and consequently the   devise mailer
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.raise_delivery_errors = true
    ActionMailer::Base.smtp_settings =
      {

        address: 'email-smtp.us-west-2.amazonaws.com',
        port: 587,
        authentication: :login,
        user_name: 'AKIAJXXJVIZWJDUSFPVA',
        password: 'AqnEpI+owvHZOBYXFLZ4R+jy0IYgprdBPOCYhVHs3lhY',
        enable_starttls_auto: true
      }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
