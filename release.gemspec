# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'release'
  spec.version       = '1.0.0'
  spec.authors       = ['Ralf Claassens']
  spec.email         = ['ralfclaassens@gmail.com']

  spec.summary       = %q{This repo contains a generic release script for bumping a git tag and pushing it to the 'origin'.}
  spec.description   = %q{This repo contains a generic release script for bumping a git tag and pushing it to the 'origin'.}
  spec.homepage      = 'https://github.com/ralfclaassens/release'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'TODO: this prevents this gem to be pushed to rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'byebug'

  spec.add_runtime_dependency 'thor', '~> 0'
  spec.add_runtime_dependency 'cocaine', '~> 0'
end
