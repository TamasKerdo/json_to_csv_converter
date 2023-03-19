# frozen_string_literal: true

require 'singleton'

module Sinatra
  module ConvertApp
    # class Configuration_helper
    class SecretHandler
      include Singleton

      def jwt_secret
        @jwt_secret ||= ENV['JWT_SECRET_KEY']
      end
    end
  end
end
