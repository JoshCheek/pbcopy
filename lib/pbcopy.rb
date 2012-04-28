require "pbcopy/version"
require 'pasteboard'


module Pbcopy
  Pasteboard = ::Pasteboard.new

  def Pasteboard.<(other)
    other.to_s | self
  end
end


class String
  def |(pbcopy)
    pbcopy.put [[Pasteboard::Type::UTF_8, self]]
    self
  end
end

def pbcopy
  Pbcopy::Pasteboard
end
