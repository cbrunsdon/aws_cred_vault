require 'spec_helper'

describe AwsCredVault::Bastion do
  let(:bastion) { described_class.new 'test_name', 'bastion.example.org' }

  describe '#name' do
    it 'has the right name' do
      expect(bastion.name).to eq 'test_name'
    end
  end

  describe '#host' do
    it 'has the right host' do
      expect(bastion.host).to eq 'bastion.example.org'
    end
  end
end
