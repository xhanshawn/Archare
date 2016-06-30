require "archare/version"
require "archare/introducer"
require "archare/crawler"



module Archare
  def self.introduce 

  	introducer = Introducer.new
  	introducer.introduce
  end


  def self.crawler

    Crawler.instance
  end

end
