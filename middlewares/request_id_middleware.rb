# frozen_string_literal: true

module Sinatra
  module ConvertApp
    module Middlewares
      # class RequestId
      class RequestId
        def initialize(app)
          @app = app
        end

        def call(env)
          Thread.current[:request_id] = SecureRandom.uuid
          @app.call(env)
        ensure
          Thread.current[:request_id] = nil
        end
      end
    end
  end
end
