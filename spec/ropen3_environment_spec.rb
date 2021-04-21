# frozen_string_literal: true

RSpec.describe ROpen3::Environment do
  version = '2.3.3'

  describe 'env()' do
    describe 'can generate an environment' do
      it 'with a specified version' do

        env = ROpen3::Environment.env(version: version)

        expect(env).to eq(
          'RBENV_VERSION' => version,
          'PATH' => ROpen3::Environment.path(version: version)
        )
      end
    end
  end

  describe 'path()' do
    it 'will inject the proper rbenv bin path' do
      path = ROpen3::Environment.path(version: version)

      expect(path.split(':')[0].include?(version))
    end

    it 'will inject the proper rbenv bin path for an arbitrary environment' do
      path = ROpen3::Environment.path(version: version, env: { 'PATH' => '' })

      expect(path).to eq( ROpen3::Environment.rbenv_version_path(version: version))
    end
  end
end
