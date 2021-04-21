# frozen_string_literal: true

RSpec.describe ROpen3 do
  ruby_version = ENV['ROPEN3_ALTERNATE'] || '2.7.3'

  it 'has a version number' do
    expect(ROpen3.version).not_to be nil
  end

  describe 'can run a shell command using a different Ruby version' do
    it 'with the correct gem environment' do
      open3 = ROpen3.new(version: ruby_version)
      gem_env = nil

      open3.popen3('gem env') do |_sin, sout, serr, proc|
        gem_env = sout.read
      end

      version_actual = gem_env.scan(/RUBY VERSION: (\S+)/)[0][0]

      expect(version_actual).to eq(ruby_version)
    end

    it 'with the correct gem environment, plus Gemfile override' do
      gemfile = File.expand_path('./example/Gemfile', __dir__)
      gem_env_version = nil
      bundle_gemfile = nil

      ROpen3.new(version: ruby_version, gemfile: gemfile) do |open3|
        open3.popen3('gem env') do |_sin, sout, serr, proc|
          gem_env_version = sout.read.scan(/RUBY VERSION: (\S+)/)[0][0]
        end

        open3.popen3('bundle config gemfile') do |_sin, sout, serr, proc|
          bundle_gemfile = sout.read.scan(/BUNDLE_GEMFILE:\s+\"([^"]+)\"/)[0][0]
        end
      end

      expect(gem_env_version).to eq(ruby_version)
      expect(bundle_gemfile).to eq(gemfile)
    end
  end

  describe 'can run an executable using a different Ruby version' do
    it 'with the correct gem environment' do
      open3 = ROpen3.new(version: ruby_version)
      gem_env = nil

      open3.popen3('gem', 'env') do |_sin, sout, serr, proc|
        gem_env = sout.read
      end

      version_actual = gem_env.scan(/RUBY VERSION: (\S+)/)[0][0]

      expect(version_actual).to eq(ruby_version)
    end
  end
end
