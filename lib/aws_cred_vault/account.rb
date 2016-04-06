require_relative 'user'

module AwsCredVault
  class Account
    attr_reader :name, :users, :bastions
    def initialize name
      @name = name
      @users = []
      @bastions = []
    end

    def add_user user
      @users << user
    end

    def add_bastion bastion
      @bastions << bastion
    end
  end
end
