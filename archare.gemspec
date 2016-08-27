# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'archare/version'

Gem::Specification.new do |spec|
  spec.name          = "archare"
  spec.version       = Archare::VERSION
  spec.authors       = ["xhanshawn"]
  spec.email         = ["xhan610@gmail.com"]

  spec.summary       = %q{Archare gem}
  spec.description   = %q{A gem for archare.}
  spec.homepage      = "http://archare.elasticbeanstalk.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "curb", "~> 0.9"


  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "curb", "~> 0.9"
  # spec.add_development_dependency "rspec-nc"
  # spec.add_development_dependency "guard"
  # spec.add_development_dependency "guard-rspec"
  # spec.add_development_dependency "pry"
  # spec.add_development_dependency "pry-remote"
  # spec.add_development_dependency "pry-nav"
end
