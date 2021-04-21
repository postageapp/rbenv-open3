# frozen_string_literal: true

require_relative 'rbenv_open3/version'

require 'open3'

class RbenvOpen3
  attr_reader :version
  attr_reader :gemfile

  def initialize(version:, gemfile: nil)
    @version = version
    @gemfile = gemfile
  end

  def env
    {
      'RBENV_VERSION' => @version,
      'BUNDLE_GEMFILE' => @gemfile
    }
  end

  def popen3(*cmd, &block)
    env =
      case (cmd.first)
      when Hash
        # Environment
        cmd.shift
      else
        { }
      end

    Open3.popen3(env, *cmd, &block)
  end
end
