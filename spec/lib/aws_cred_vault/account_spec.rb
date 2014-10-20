require 'spec_helper'

describe AwsCredVault::Account do
  describe 'name' do
    let(:account) { AwsCredVault::Account.new 'test' }

    it 'has the right name' do
      expect(account.name).to eq 'test'
    end
  end

  describe 'add_user' do
    let(:account) { AwsCredVault::Account.new 'test' }
    let(:user) { AwsCredVault::User.new 'test_user', 'id', 'key' }

    subject { account.add_user user }

    it 'adds the user' do
      expect { subject }.to change {account.users.length}.by(1)
    end
  end
end
