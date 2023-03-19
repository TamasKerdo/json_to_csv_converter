# frozen_string_literal: true

RSpec.shared_context 'JWT' do
  let(:valid_jwt) do
    jwt_secret = ENV['JWT_SECRET_KEY']
    payload = { user_id: 1 }
    JWT.encode(payload, jwt_secret, 'HS256')
  end
  let(:invalid_jwt) { "#{valid_jwt} invalid" }
  let(:jwt_secret) { ENV['JWT_SECRET_KEY'] }
  let(:algorithm) { 'HS256' }

  around(:each) do |example|
    original_jwt_secret = ENV['JWT_SECRET_KEY']
    ENV['JWT_SECRET_KEY'] = 'test_secret_key'

    example.run

    ENV['JWT_SECRET_KEY'] = original_jwt_secret
  end
end
