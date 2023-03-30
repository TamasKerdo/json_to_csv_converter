# frozen_string_literal: true

require 'jwt'

module Sinatra
  module ConvertApp
    # module Jwt
    module Jwt
      # class Jwt::Authorizer
      class Authorizer
        attr_reader :token, :algorithm

        def initialize(token:, secret_handler:, algorithm: 'HS256')
          @token = token
          @jwt_secret = secret_handler.jwt_secret
          @algorithm = algorithm
        end

        def authorize
          decoded_token = JWT.decode(token, jwt_secret, true, { algorithm: algorithm })
          return true if decoded_token

        rescue JWT::DecodeError
          false
        end

        private

        attr_reader :jwt_secret
      end
    end
  end
end
