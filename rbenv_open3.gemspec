# frozen_string_literal: true

require_relative './lib/ropen3/version'

Gem::Specification.new do |spec|
  spec.name = 'ropen3'
  spec.version = ROpen3.version
  spec.authors = [ 'Scott Tadman' ]
  spec.email = %w[ tadman@postageapp.com ]

  spec.summary = 'Run commands in an rbenv environment'
  spec.description = 'Wrapper around Open3.popen3 with rbenv support'
  spec.homepage = 'https://github.com/postageapp/rbenv-open3'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = %w[ lib ]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency 'example-gem', '~> 1.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
