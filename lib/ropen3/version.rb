# frozen_string_literal: true

class ROpen3
  VERSION = File.read(File.expand_path('../../VERSION', __dir__)).chomp.freeze

  def self.version
    VERSION
  end
end
