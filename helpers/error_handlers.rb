# frozen_string_literal: true

module Sinatra
  module ConvertApp
    module Helpers
      # module ErrorHandlers
      module ErrorHandlers
        def self.registered(app)
          app.error Sinatra::ConvertApp::Errors::UnauthorizedError do
            status 401
            content_type 'application/json'
            { error: 'Unauthorized' }.to_json
          end

          app.error JSON::ParserError do
            status 400
            content_type 'application/json'
            { error: 'Invalid JSON input' }.to_json
          end

          app.error 500 do
            content_type 'application/json'
            { error: 'An unexpected error occurred' }.to_json
          end
        end
      end
    end
  end
end
