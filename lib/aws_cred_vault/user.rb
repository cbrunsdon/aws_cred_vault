
module AwsCredVault
  class User
    attr_reader :name, :access_key, :secret

    def initialize name, access_key, secret
      @name = name
      @access_key = access_key
      @secret = secret
    end

    def credentials
      {
        aws_access_key_id: access_key,
        aws_secret_access_key: secret
      }
    end
  end

end
