# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require_relative '../app'

Dir[File.join(__dir__, 'support/**/*.rb')].sort.each { |f| require_relative f }
Dir[File.join(__dir__, '**/*_spec.rb')].sort.each { |f| require_relative f }

RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app
    ConvertApp
  end
end
