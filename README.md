# AwsCredVault

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aws_cred_vault'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws_cred_vault

## Usage

Create `~/.aws_cred_vault` in the following form:

```
[accounts.$account_name.$ssh_username]
access_key = "$AWS_ACCESS_KEY"
secret = "$AWS_SECRET_KEY"

```

* `$account_name` will be used to identify which credentials you want to use
* `$ssh_username` will be used for ssh access

## Contributing

1. Fork it ( https://github.com/[my-github-username]/AwsCredVault/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
