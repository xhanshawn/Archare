require "archare/version"
require "archare/introducer"
require "archare/crawler"
require "Ohai"


module Archare
  def self.introduce 

  	introducer = Introducer.new
  	introducer.introduce
  end


  def self.crawler
    Crawler.instance
  end

  def self.jumper
    system = Ohai::System.new
    system.all_plugins
    puts system.to_json
  end
end
