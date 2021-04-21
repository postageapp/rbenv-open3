# frozen_string_literal: true

require_relative 'ropen3/version'

require 'open3'

class ROpen3
  attr_reader :version
  attr_reader :gemfile

  def initialize(version:, gemfile: nil)
    @version = version
    @gemfile = gemfile

    @env = {
      'RBENV_VERSION' => @version,
      'BUNDLE_GEMFILE' => @gemfile
    }.freeze
  end

  def popen3(*cmd, &block)
    env_arg = @env.merge(
      case (cmd.first)
      when Hash
        # Pull off environment argument
        cmd.shift
      else
        { }
      end
    )

    if (defined?(Bundler))
      Bundler.with_unbundled_env do
        Open3.popen3(env_arg, *cmd, &block)
      end
    else
      Open3.popen3(env_arg, *cmd, &block)
    end
  end
end
