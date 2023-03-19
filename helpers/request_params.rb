# frozen_string_literal: true

module Sinatra
  module ConvertApp
    module Helpers
      # module Actions
      module RequestParams
        def request_body
          JSON.parse(request.body.read)
        end
      end
    end
  end
end
