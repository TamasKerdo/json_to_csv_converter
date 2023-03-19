# frozen_string_literal: true

module Sinatra
  module ConvertApp
    module Helpers
      # module ErrorHandlers
      module ErrorHandlers
        def self.registered(app)
          app.error Sinatra::ConvertApp::Errors::UnauthorizedError do
            CustomLogger.instance.error('Unauthorized access attempt')
            status 401
            content_type 'application/json'
            { error: 'Unauthorized' }.to_json
          end

          app.error JSON::ParserError do
            CustomLogger.instance.error('Invalid JSON input')
            status 400
            content_type 'application/json'
            { error: 'Invalid JSON input' }.to_json
          end

          app.error 500 do
            CustomLogger.instance.error('An unexpected error occurred')
            content_type 'application/json'
            { error: 'An unexpected error occurred' }.to_json
          end
        end
      end
    end
  end
end
