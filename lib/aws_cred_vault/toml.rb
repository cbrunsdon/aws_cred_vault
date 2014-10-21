require 'toml'
require_relative 'account'

module AwsCredVault
  class Toml
    attr_reader :file
    def initialize file
      @file = file
    end

    # Returns the account with the matching name, or nil if none exists
    def account name
      accounts.detect { |x| x.name == name }
    end

    # Returns the list of all accounts in the vault
    def accounts
      account_hash.map do |name, user_list|
        account = Account.new name
        user_list.each do |name, credentials|
          account.add_user User.new name, credentials["access_key"], credentials["secret"]
        end
        account
      end
    end

    def add_account site, name, access_key, secret
      new_accounts = account_hash || {}
      new_accounts[site] = {
        name => {
          'access_key' => access_key,
          'secret'     => secret,
        }
      }
      save new_accounts
    end

    private
    def toml
      return {} unless File.exists? file
      ::TOML.load_file(file)
    end

    def account_hash
      toml["accounts"] || {}
    end

    def save accounts
      File.open file, 'w' do |file|
        file.write(::TOML::Generator.new(accounts).body)
      end
    end
  end
end
