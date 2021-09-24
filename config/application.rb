require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module BooksApp
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    I18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja
  end
end
