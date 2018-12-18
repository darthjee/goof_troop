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
end
