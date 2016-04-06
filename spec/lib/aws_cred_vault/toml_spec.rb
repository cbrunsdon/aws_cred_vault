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
        expect(subject).to eq([])
      end
    end

    it 'creates the right user name' do
      expect(subject.first.users.first.access_key).to eq 'fenix'
    end

    it 'creates the right secret' do
      expect(subject.first.users.first.secret).to eq 'zealot!'
    end

    it 'has the right bastions' do
      expect(subject.first.bastions.first.name).to eq "staging"
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

  describe '#account' do
    let(:file) {  }
    let(:vault) { AwsCredVault::Toml.new('spec/files/accounts.toml') }

    it 'returns nil when no account exists' do
      expect(vault.account('nope')).to be_nil
    end

    it 'returns an account when valid' do
      expect(vault.account('protoss')).to be_a AwsCredVault::Account
    end
  end
end
