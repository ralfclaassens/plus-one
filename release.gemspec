# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'release'
  spec.version       = '1.0.0'
  spec.authors       = ['Ralf Claassens']
  spec.email         = ['ralfclaassens@gmail.com']

  spec.summary       = "This generic release script for bumping a git tag and pushing it to the 'origin'."
  spec.description   = "This generic release script for bumping a git tag and pushing it to the 'origin'."
  spec.homepage      = 'https://github.com/ralfclaassens/release'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'

  spec.add_runtime_dependency 'thor', '~> 0'
  spec.add_runtime_dependency 'cocaine', '~> 0'
end
