# frozen_string_literal: true

class RbenvOpen3
  VERSION = File.read(File.expand_path('../../VERSION', __dir__)).chomp.freeze

  def self.version
    VERSION
  end
end
