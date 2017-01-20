# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apiify/version'

Gem::Specification.new do |spec|
  spec.name          = "apiify"
  spec.version       = Apiify::VERSION
  spec.authors       = ["Chris Cooper", "Jenna Ramdenee", "Keomony Khun", "Oscar Barlow"]
  spec.email         = ["oscar.barlow@gmail.com"]

  spec.summary       = %q{takes a .csv file, churns out an API.}
  spec.description   = %q{apiify is a little gem that takes any .csv file and turns it into an API.

  It's aimed at large organisations, e.g. government departments, that publish a lot of data as .csv and who want a quick way to access this data as JSON in their digital services.}
  spec.homepage      = "https://github.com/oscar-barlow/apiify"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber", "~> 1.3"
  spec.add_development_dependency "aruba", "~> 0.14.2"
  spec.add_dependency "thor", "~> 0.19"
  spec.add_runtime_dependency "active_model_serializers", "~> 0.10.0"

end
