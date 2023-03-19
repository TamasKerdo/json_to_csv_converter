# frozen_string_literal: true

# module AuthorizationHelper

module Sinatra
  module ConvertApp
    module Helpers
      # module Authorization
      module Authorization
        def authorization_params(request:)
          authorization_params_handler(request: request).authorization_params
        end

        def authorize(**args)
          authorizer(args).authorize
        end

        private

        def authorization_params_handler(request:)
          Jwt::AuthorizationParamsHandler.new(request: request)
        end

        def authorizer(args)
          token = args[:token]
          Jwt::Authorizer.new(token: token, secret_handler: secret_handler)
        end

        def secret_handler
          SecretHandler.instance
        end
      end
    end
  end
end
