# frozen_string_literal: true

require_relative 'request_id_middleware'

ConvertApp.use Sinatra::ConvertApp::Middlewares::RequestId
