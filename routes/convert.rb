# frozen_string_literal: true

module Sinatra
  module ConvertApp
    module Routing
      # module Convert
      module Convert
        def self.registered(app)
          converter = lambda do
            csv = JsonToCsvConverter.new(body: request_body).to_csv
            content_type 'text/csv'
            attachment('result.csv')
            csv
          end

          app.post '/convert', &converter
        end
      end
    end
  end
end
