require "archare/version"
require "archare/introducer"

require 'nokogiri'
require 'curb'


module Archare
  def self.introduce 

    page = Curl.get("http://www.google.com/")


    page2 = Nokogiri::HTML(page.body_str)

    puts page2.xpath('//a')
    # puts page.body_str


  	introducer = Introducer.new
  	introducer.introduce
  end
end
