# frozen_string_literal: true

describe Sinatra::ConvertApp::Jwt::Authorizer do
  include_context 'JWT'

  let(:secret_handler) { Sinatra::ConvertApp::SecretHandler.instance }

  describe '#authorize' do
    context 'with valid JWT token' do
      let(:authorizer) { described_class.new(token: valid_jwt, secret_handler: secret_handler, algorithm: algorithm) }

      it 'returns true' do
        expect(authorizer.authorize).to eq(true)
      end
    end

    context 'with invalid JWT token' do
      let(:authorizer) { described_class.new(token: invalid_jwt, secret_handler: secret_handler, algorithm: algorithm) }

      it 'returns false' do
        expect(authorizer.authorize).to eq(false)
      end
    end

    context 'with missing JWT token' do
      let(:authorizer) { described_class.new(token: nil, secret_handler: secret_handler, algorithm: algorithm) }

      it 'returns false' do
        expect(authorizer.authorize).to eq(false)
      end
    end

    context 'with incorrect algorithm' do
      let(:authorizer) { described_class.new(token: valid_jwt, secret_handler: secret_handler, algorithm: 'HS384') }

      it 'returns false' do
        expect(authorizer.authorize).to eq(false)
      end
    end
  end
end
