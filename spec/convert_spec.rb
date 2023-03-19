# frozen_string_literal: true

require_relative 'spec_helper'

describe 'ConvertApp' do
  include_context 'JWT'

  describe 'POST /convert' do
    let(:json_input) { [{ "name": "John", "age": 30 }] }
    let(:csv_output) { "name,age\nJohn,30\n" }

    context 'with valid JWT token' do
      before do
        header 'Authorization', "Bearer #{valid_jwt}"
        post '/convert', json_input.to_json, 'CONTENT_TYPE' => 'application/json'
      end

      it 'returns status 200' do
        expect(last_response.status).to eq(200)
      end

      it 'returns CSV content' do
        expect(last_response.body).to eq(csv_output)
      end
    end

    context 'with invalid JWT token' do
      before do
        header 'Authorization', "Bearer #{invalid_jwt}"
        post '/convert', json_input.to_json, 'CONTENT_TYPE' => 'application/json'
      end

      it 'returns status 401' do
        expect(last_response.status).to eq(401)
      end

      it 'returns an unauthorized error message' do
        expect(JSON.parse(last_response.body)['error']).to eq('Unauthorized')
      end
    end

    context 'with missing JWT token' do
      before do
        post '/convert', json_input.to_json, 'CONTENT_TYPE' => 'application/json'
      end

      it 'returns status 401' do
        expect(last_response.status).to eq(401)
      end

      it 'returns an unauthorized error message' do
        expect(JSON.parse(last_response.body)['error']).to eq('Unauthorized')
      end
    end
  end
end
