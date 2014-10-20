require_relative 'user'

module AwsCredVault
  class Account
    attr_reader :name, :users
    def initialize name
      @name = name
      @users = []
    end

    def add_user user
      @users << user
    end
  end
end
