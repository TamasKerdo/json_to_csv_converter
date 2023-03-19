# frozen_string_literal: true

RSpec.describe Sinatra::ConvertApp::JsonToCsvConverter do
  describe '#to_csv' do
    let(:input_json) do
      [
        { 'name' => 'John', 'age' => 30, 'city' => 'New York' },
        { 'name' => 'Jane', 'age' => 28, 'city' => 'San Francisco' }
      ]
    end
    let(:csv_output) do
      "name,age,city\nJohn,30,New York\nJane,28,San Francisco\n"
    end

    subject { described_class.new(body: input_json) }

    it 'converts JSON to CSV' do
      expect(subject.to_csv).to eq(csv_output)
    end

    context 'when called multiple times' do
      it 'returns the same CSV content without recomputing' do
        expect(subject.to_csv).to eq(csv_output)
        expect(subject.to_csv).to eq(csv_output)
      end
    end
  end
end
