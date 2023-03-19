# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Sinatra::ConvertApp::Jwt::AuthorizationParamsHandler do
  describe '#authorization_params' do
    let(:request) { instance_double('Rack::Request') }
    subject { described_class.new(request: request) }

    context 'when authorization header is present' do
      let(:auth_header) { 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ._XK7DVL_dxKxY20_ktY5gd5-YQKvu1bROFhC0Mqy3Jg' }

      before do
        allow(request).to receive(:env).and_return({ 'HTTP_AUTHORIZATION' => auth_header })
      end

      it 'returns a hash with token key and value' do
        expect(subject.authorization_params).to eq({ token: auth_header.split(' ').last })
      end
    end

    context 'when authorization header is not present' do
      before do
        allow(request).to receive(:env).and_return({})
      end

      it 'returns nil' do
        expect(subject.authorization_params).to be_nil
      end
    end
  end
end



