# frozen_string_literal: true

require_relative 'authorization'
require_relative 'error_handlers'

ConvertApp.helpers Sinatra::ConvertApp::Helpers::Authorization
ConvertApp.register Sinatra::ConvertApp::Helpers::ErrorHandlers
