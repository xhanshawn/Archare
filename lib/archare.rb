require "archare/version"
require "archare/introducer"
require "archare/crawler"



module Archare
  def self.introduce 

  	introducer = Introducer.new
  	introducer.introduce
  end

  @@crawler = nil
  def self.crawler
    @@crawler = Crawler.new unless @@crawler
    return @@crawler
  end

end
