# frozen_string_literal: true

require 'sinatra/base'

# class ConvertApp
class ConvertApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :show_exceptions, :after_handler
end

require_relative 'lib/init'
require_relative 'routes/init'
require_relative 'helpers/init'
