require "archare/version"
require "archare/introducer"

module Archare
  def self.introduce
  	introducer = Introducer.new
  	introducer.introduce
  end
end
