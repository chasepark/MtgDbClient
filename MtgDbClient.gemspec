# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'MtgDbClient/version'

Gem::Specification.new do |spec|
  spec.name          = "MtgDbClient"
  spec.version       = MtgDbClient::VERSION
  spec.authors       = ["Chase Park"]
  spec.email         = ["chasepark@comcast.net"]
  spec.description   = %q{Client gem that wraps the MtgDb Api}
  spec.summary       = %q{Client gem that wraps the MtgDb Api}
  spec.homepage      = "http://www.github.com/chasepark/MtgDbClient"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "httparty", "~> 0.13.1"
end
