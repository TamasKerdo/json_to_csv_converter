# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Sinatra::ConvertApp::CustomLogger do
  let(:logger_instance) { described_class.instance }
  let(:log_file_path) { logger_instance.send(:log_file_path) }
  let(:log_directory_path) { logger_instance.send(:log_directory_path) }
  let(:test_message) { 'Test message' }

  around(:each) do |example|
    Thread.current[:request_id] = '12345'

    example.run

    Thread.current[:request_id] = nil
  end

  context 'logging messages' do
    it 'logs an info message' do
      logger_instance.info(test_message)

      expect(File.read(log_file_path)).to include("[12345] #{test_message}")
    end

    it 'logs a debug message' do
      logger_instance.debug(test_message)

      expect(File.read(log_file_path)).to include("[12345] #{test_message}")
    end

    it 'logs an error message' do
      logger_instance.error(test_message)

      expect(File.read(log_file_path)).to include("[12345] #{test_message}")
    end
  end

  context 'without request id' do
    it 'logs a message with N/A as request id' do
      Thread.current[:request_id] = nil
      logger_instance.info(test_message)

      expect(File.read(log_file_path)).to include("[N/A] #{test_message}")
    end
  end
end
