module ROpen3::Environment
  def env(version:, gemfile: nil, env: ENV)
    {
      'RBENV_VERSION' => version,
      'BUNDLE_GEMFILE' => gemfile,
      'PATH' => path(version: version, env: env)
    }.compact.freeze
  end

  def rbenv_version_path(version:)
    File.expand_path('~/.rbenv/versions/%s/bin' % version)
  end

  def path(version:, env: ENV)
    (
      [
        rbenv_version_path(version: version)
      ] + env['PATH'].split(/:/).reject do |path|
        path.include?('.rbenv')
      end
    ).join(':')
  end

  extend self
end
