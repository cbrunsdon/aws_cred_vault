# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_cred_vault/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_cred_vault"
  spec.version       = AwsCredVault::VERSION
  spec.authors       = ["Clarke Brunsdon"]
  spec.email         = ["clarke@freerunningtechnologies.com"]
  spec.summary       = %q{Stores your amazon credentials for multiple IAM accounts.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "toml", "~> 0.1"
  spec.add_dependency "aws-sdk", "~> 1.56"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
