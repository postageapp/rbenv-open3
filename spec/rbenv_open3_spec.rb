# frozen_string_literal: true

RSpec.describe ROpen3 do
  it 'has a version number' do
    expect(ROpen3.version).not_to be nil
  end

  describe 'can run a shell command using a different Ruby version' do
    version_requested = '2.7.3'

    it 'with the correct gem environment' do
      open3 = ROpen3.new(version: version_requested)
      gem_env = nil

      open3.popen3('gem env') do |_sin, sout, serr, proc|
        gem_env = sout.read
      end

      version_actual = gem_env.scan(/RUBY VERSION: (\S+)/)[0][0]

      expect(version_actual).to eq(version_requested)
    end
  end

  it 'can run an executable using a different Ruby version' do
    version_requested = '2.7.3'

    open3 = ROpen3.new(version: version_requested)
    gem_env = nil

    open3.popen3('gem', 'env') do |_sin, sout, serr, proc|
      gem_env = sout.read
    end

    version_actual = gem_env.scan(/RUBY VERSION: (\S+)/)[0][0]

    expect(version_actual).to eq(version_requested)
  end
end
