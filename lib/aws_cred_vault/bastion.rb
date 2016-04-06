
module AwsCredVault
  class Bastion
    attr_reader :name, :host

    def initialize name, host
      @name = name
      @host = host
    end

  end

end
