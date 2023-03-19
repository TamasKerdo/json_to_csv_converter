# frozen_string_literal: true

module Sinatra
  module ConvertApp
    # module Jwt
    module Jwt
      # class AuthorizationParamsHandler
      class AuthorizationParamsHandler
        attr_accessor :request

        def initialize(request:)
          @request = request
        end

        def authorization_params
          return nil if auth_header.nil?

          prepare_params(auth_header.split(' ').last)
        end

        private

        def auth_header
          request.env['HTTP_AUTHORIZATION']
        end

        def prepare_params(token)
          { token: token }
        end
      end
    end
  end
end
