# frozen_string_literal: true

require 'sinatra/base'

# class ConvertApp
class ConvertApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :show_exceptions, :after_handler

  private

  def request_body
    JSON.parse(request.body.read)
  end
end

require_relative 'lib/init'
require_relative 'routes/init'
require_relative 'helpers/init'
require_relative 'middlewares/init'
