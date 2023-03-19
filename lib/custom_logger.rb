# frozen_string_literal: true

require 'logger'
require 'singleton'

module Sinatra
  module ConvertApp
    # class CustomLogger
    class CustomLogger
      include Singleton

      def info(message)
        @logger.info(format_message(message))
      end

      def debug(message)
        @logger.debug(format_message(message))
      end

      def error(message)
        @logger.error(format_message(message))
      end

      private

      def initialize
        @logger = create_logger
      end

      def create_logger
        logger = Logger.new(log_file_path)
        logger.level = Logger.const_get(ENV['LOG_LEVEL'] || 'DEBUG')
        logger
      end

      def log_file_path
        log_path = File.join(log_directory_path, 'app.log')
        FileUtils.mkdir_p(log_directory_path)
        FileUtils.touch(log_path)
        log_path
      end

      def log_directory_path
        File.join(File.dirname(__FILE__), '..', 'log', ENV['RACK_ENV'])
      end

      def format_message(message)
        "[#{request_id}] #{message}"
      end

      def request_id
        Thread.current[:request_id] || 'N/A'
      end
    end
  end
end
