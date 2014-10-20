require 'spec_helper'

describe AwsCredVault::User do
  let(:user) { AwsCredVault::User.new 'test', 'id', 'key' }

  describe 'name' do
    it 'has the right name' do
      expect(user.name).to eq 'test'
    end
  end

  describe 'credentials' do
    subject { user.credentials }

    it 'adds the user' do

      expect(subject).to eq(
        {
          aws_access_key_id: 'id',
          aws_secret_access_key: 'key'
        }
      )
    end
  end
end
