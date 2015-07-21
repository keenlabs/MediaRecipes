require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Keenmedia
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end

# ENV['KEEN_PROJECT_ID']=
# ENV['KEEN_WRITE_KEY']=

DEFAULT_USER_AGENT = {
  "browser" => {
        "name" => "Chrome",
        "version" => "28.0.1500.95",
        "major" => 28
    },
    "engine" => {
        "name" => "WebKit",
        "version" => "537.36"
    },
    "os" => {
        "name" => "Mac OS X",
        "version" => "10.7.4"
    }
}

DEFAULT_EXTERNAL_REFERRER = {
    "type" => "external",
    "source" => "http://www.referrer.com/some/ad?param1=foo&param2=bar/#someplace",
    "protocol" => "http",
    "domain" => "www.referrer.com"
}

DEFAULT_SESSION = {
    "session_id" => "session-cookie",
    "unique_id" => "unique-cookie" 
}