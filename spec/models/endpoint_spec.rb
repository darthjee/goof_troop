require 'spec_helper'

describe Endpoint do
  subject(:endpoint) { create(:endpoint, name: name) }

  let(:id)   { endpoint.id.to_s }
  let(:name) { 'test host' }

  describe '.find' do
    it 'retrieves document from database' do
      expect(described_class.find(id)).to eq(endpoint)
    end
  end

  describe '#name' do
    it 'returns the name defined' do
      expect(endpoint.name).to eq(name)
    end
  end

  describe '#created_at' do
    it 'returns time of creation' do
      expect(endpoint.created_at).to be_a(ActiveSupport::TimeWithZone)
    end
  end

  describe '#updated_at' do
    it 'returns time of update' do
      expect(endpoint.updated_at).to be_a(ActiveSupport::TimeWithZone)
    end
  end

  describe '#responses' do
    it 'returns an array of responses' do
      expect(endpoint.responses).to be_a(Array)
      expect(endpoint.responses).to have(2).responses
      endpoint.responses.each do |response|
        expect(response).to be_a(Response)
      end
    end
  end

  describe '#as_json' do
    let(:expected) do
      {
        'name' => name,
        'responses' => [
          { 'code' => 200 },
          { 'code' => 500 }
        ]
      }
    end

    it 'returns the json of the endpoint' do
      endpoint.responses
      expect(endpoint.as_json).to match(hash_including(expected))
    end
  end
end
