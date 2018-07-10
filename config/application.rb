require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Wizdomiz
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.generators do |g|
      g.assets      false
      g.helper      false
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| %Q(#{html_tag}).html_safe }
  end
end
