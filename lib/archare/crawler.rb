require 'nokogiri'
require 'curb'

require 'json'
require 'singleton'

class Archare::Crawler

  include Singleton

  @@LEETCODE_URI_BASE = "https://leetcode.com/"

  @@LEETCODE_URI_PROBLEM = @@LEETCODE_URI_BASE + "problemset/algorithms/"

  @@LEETCODE_URI_TAG = @@LEETCODE_URI_BASE + "tag/"



  def lc_problems(update = false, uri = @@LEETCODE_URI_PROBLEM)
    
    problems = []
    

    unless update
      tags_hash = read_json_file "lc_problems"
      problems = tags_hash["problems"]
    else
      body = get_dom_from_uri(uri)
      problem_list = body.css('table')

      links = problem_list.css('a').each do |link|
        href_str = link['href'].to_s
        if href_str.include? '/problems/'
          problems << link.text
          # problems << href_str.split('problems/')[-1][0..-2].gsub('-', ' ')
        end
      end
    end

    return problems
  end


  def lc_tags(update = false, uri = @@LEETCODE_URI_TAG)
    
    tags = []

    unless update 
      tags_hash = read_json_file "lc_tags"
      tags = tags_hash['tags']
    else
      body = get_dom_from_uri(uri)
      links = body.css('a').each do |link|
        href_str = link['href'].to_s
        if href_str.include? '/tag/'
          tags << href_str.split('tag/')[-1][0..-2]
        end
      end
    end

    return tags
  end

  def lc_tags_problems_map(update = false)
    

    map = Hash.new

    unless update 
      map = read_json_file "lc_tags_problems_map"
    else
      tags = lc_tags
      tags.each do |tag|
        map[tag] = lc_problems(lc_tag_uri_of(tag))
      end

      write_json_file "lc_tags_problems_map", map
    end

    return map
  end


  def update_lc_data
    map = lc_tags_problems_map true
  end

  private 

    def get_dom_from_uri(uri)
      page = Curl.get(uri)
      body = Nokogiri::HTML(page.body_str).xpath('//body')
    end

    def lc_tag_uri_of(tag)
      @@LEETCODE_URI_TAG + tag + '/'
    end

    def file_directory
      File.join(File.dirname(File.expand_path(__FILE__)), '/data')
    end

    def write_json_file(file_name, map)
      File.open(file_directory + file_name + ".json", 'w') do |f|
        f.write(map.to_json)
      end
    end

    def read_json_file(file_name)
      File.open(file_directory + file_name + ".json", 'r') do |f|
        map = JSON.parse(f.read)
      end
      return map
    end
end