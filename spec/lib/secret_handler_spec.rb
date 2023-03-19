# frozen_string_literal: true

describe Sinatra::ConvertApp::SecretHandler do
  describe '#jwt_secret' do
    subject { described_class.instance.jwt_secret }

    context 'when JWT_SECRET_KEY environment variable is set' do
      include_context 'JWT'

      it 'returns the value of JWT_SECRET_KEY' do
        expect(subject).to eq(ENV['JWT_SECRET_KEY'])
      end
    end
  end
end
