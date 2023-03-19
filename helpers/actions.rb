# frozen_string_literal: true

module Sinatra
  module ConvertApp
    module Helpers
      # module Actions
      module Actions
        def self.registered(app)
          app.before do
            params = authorization_params(request: request)
            raise Sinatra::ConvertApp::Errors::UnauthorizedError unless params && authorize(params)
          end
        end
      end
    end
  end
end
