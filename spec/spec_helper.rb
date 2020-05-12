# frozen_string_literal: true

require 'bundler/setup'
require 'rspec'
require 'omniauth'
Dir[File.expand_path('support/**/*', __dir__)].sort.each { |f| require f }

RSpec.configure do |_config|
  OmniAuth.config.test_mode = true
end
