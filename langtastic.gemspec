# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'langtastic/version'

Gem::Specification.new do |spec|
  spec.name          = 'langtastic'
  spec.version       = Langtastic::VERSION
  spec.authors       = ['Ed Robinson']
  spec.email         = ['ed.robinson@reevoo.com']

  spec.summary       = 'Extracts language subtag data from the IANA registry '
  spec.description   = 'Extracts IANA language subtags'
  spec.homepage      = 'https://github.com/reevoo/langtastic'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(/^(test|spec|features)\//) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  spec.add_development_dependency 'reevoocop'
end
