require 'nokogiri'
require 'curb'


class Archare::Crawler


  @@LEETCODE_URI = 'https://leetcode.com/problemset/algorithms/'
  def lc_algorithm_problem(uri = @@LEETCODE_URI)
    page = Curl.get(uri)

    problems = []

    body = Nokogiri::HTML(page.body_str).xpath('//body')
    links = body.css('a').each do |link|
      href_str = link['href'].to_s
      if href_str.include? '/problems/'
        problems << href_str.split('problems/')[-1][0..-2]
      end
    end

    return problems
  end
end