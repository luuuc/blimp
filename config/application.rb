require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blimp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Compress html and json views
    config.middleware.use Rack::Deflater

    # Set Rails Generators
    config.generators do |g|
      g.test_framework :rspec, fixture: true, view_specs: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    # Load Environment Variables
    config.before_configuration do
      h = {}
      def transform h, key, hash
        hash.each do |k, v|
          combined_key = [key, k].delete_if { |k| k == '' }.join("_")
          v.is_a?(Hash) ? transform(h, combined_key, v) : h[combined_key.upcase] = v.to_s
        end
      end

      env_file = File.join Rails.root, 'config', 'app.yml'
      transform(h, '', YAML.load(File.open env_file)) if File.exists? env_file
      h.each { |k, v| ENV[k] = v }
    end
  end
end
