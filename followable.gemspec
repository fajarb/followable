# -*- encoding: utf-8 -*-
require File.expand_path('../lib/followable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Fajar Budiprasetyo"]
  gem.email         = ["fajar.ab@gmail.com"]
  gem.description   = %q{ adds following feature to any ActiveRecord object using Redis }
  gem.summary       = %q{ Followable adds following feature to any ActiveRecord object using Redis }
  gem.homepage      = "https://github.com/fajarb/followable"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "followable"
  gem.require_paths = ["lib"]
  gem.version       = Followable::VERSION

  gem.add_runtime_dependency('redis', '~> 3.0.1')

  gem.add_development_dependency('rspec', '~> 2.11.0')
end
