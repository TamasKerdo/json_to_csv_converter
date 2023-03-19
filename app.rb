# frozen_string_literal: true

require 'sinatra/base'

#%w[helpers lib routes].each do |folder|
#  Dir[File.join(__dir__, folder, '**/*.rb')].sort.each do |f|
#    require_relative f
#  end
#end

require_relative 'lib/init'

# class ConvertApp
class ConvertApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :show_exceptions, :after_handler

  before do
    params = authorization_params(request: request)
    raise Sinatra::ConvertApp::Errors::UnauthorizedError unless params && authorize(params)
  end

  def request_body
    JSON.parse(request.body.read)
  end
end

require_relative 'routes/init'
require_relative 'helpers/init'
