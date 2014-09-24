require 'toml'

module AwsCredVault
  class Toml
    attr_reader :file
    def initialize file
      @file = file
    end

    def accounts
      toml["accounts"] || {}
    end

    def add_account site, name, access_key, secret
      new_accounts = accounts || {}
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

    def save accounts
      File.open file, 'w' do |file|
        file.write(::TOML::Generator.new(accounts).body)
      end
    end
  end
end
