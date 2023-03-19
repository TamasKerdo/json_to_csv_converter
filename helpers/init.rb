# frozen_string_literal: true

require_relative 'authorization'
require_relative 'error_handlers'
require_relative 'actions'
require_relative 'request_params'

ConvertApp.helpers Sinatra::ConvertApp::Helpers::Authorization
ConvertApp.helpers Sinatra::ConvertApp::Helpers::RequestParams

ConvertApp.register Sinatra::ConvertApp::Helpers::ErrorHandlers
ConvertApp.register Sinatra::ConvertApp::Helpers::Actions
