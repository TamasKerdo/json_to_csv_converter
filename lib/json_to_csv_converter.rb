# frozen_string_literal: true

require 'json'
require 'csv'

module Sinatra
  module ConvertApp
    # class JsonToCsvConverter
    class JsonToCsvConverter
      attr_reader :input_json

      def initialize(body:, options: {})
        @input_json = body
        @options = options
      end

      def to_csv
        @csv ||= convert
      end

      private

      def convert
        CSV.generate(headers: true) do |csv|
          csv << input_json.first.keys

          input_json.each do |row|
            csv << row.values
          end
        end
      end
    end
  end
end
