require 'spec_helper'

describe AwsCredVault::Toml do

  describe '#new' do
    subject { AwsCredVault::Toml.new 'sups' }
    it 'has the right file' do
      expect(subject.file).to eq('sups')
    end
  end

  describe '#accounts' do
    let(:file) { 'spec/files/accounts.toml' }

    subject { AwsCredVault::Toml.new(file).accounts }

    it 'lists all the accounts' do
      expect(subject.length).to eq 2
    end

    context 'file does not exist' do
      let(:file) { '/notthing/here' }

      it 'has no accounts' do
        expect(subject).to eq({})
      end
    end
  end

  describe '#add_account' do
    let(:file) { '/tmp/working_file' }

    let(:site) { 'frt' }
    let(:account_name) { 'clarke' }
    let(:key) { 'key' }
    let(:secret) { 'password' }

    let(:vault) { AwsCredVault::Toml.new(file) }
    subject { vault.add_account(site, account_name, key, secret) }

    it 'saves to a file' do
      subject
      expect(::TOML.load(File.read(file))).to eq({
        'frt' => {
          'clarke' => {
            'access_key' => 'key',
            'secret' => 'password'
          }
        }
      })
    end
  end

end
