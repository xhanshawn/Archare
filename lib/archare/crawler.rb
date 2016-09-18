require 'nokogiri'
require 'curb'

require 'json'
require 'singleton'

class Archare::Crawler

  include Singleton

  LEETCODE_URI_BASE = "https://leetcode.com/"

  LEETCODE_URI_PROBLEM = LEETCODE_URI_BASE + "problemset/algorithms/"

  LEETCODE_URI_TAG = LEETCODE_URI_BASE + "tag/"

  def lc_problems(update = false, uri = LEETCODE_URI_PROBLEM)
    problems = []

    if update
      if uri != LEETCODE_URI_PROBLEM
        body = get_dom_from_uri(uri)
        problem_list = body.css('table')
        links = problem_list.css('a').each do |link|
          href_str = link['href'].to_s
          if href_str.include? '/problems/'
            problems << link.text
            # problems << href_str.split('problems/')[-1][0..-2].gsub('-', ' ')
          end
        end
        write_json_file "lc_problems", { :problems => problems }
      else
        update_lc_data
      end
    else
      problems_h = read_json_file "lc_problems"
      problems = problems_h["problems"]
    end
    problems
  end


  def lc_tags(update = false, uri = LEETCODE_URI_PROBLEM)
    tags = []
    tags_hash = {}

    if update
      body = get_dom_from_uri(uri)
      links = body.css('a').each do |link|
        href_str = link['href'].to_s
        if href_str.include? '/tag/'
          tags << href_str.split('tag/')[-1][0..-2]
        end
      end
      tags_hash['tags'] = tags
      write_json_file "lc_tags", tags_hash
    else
      tags_hash = read_json_file "lc_tags"
      tags = tags_hash['tags']
    end
    tags
  end

  def lc_tags_problems_map(update = false)
    map = update ? {} : read_json_file("lc_tags_problems_map")

    if update
      @updating = true
      problems = []
      tags = lc_tags(true)
      puts "updating tags-problems map. It will finish in about 20s \n\n"
      threads, tag_to_problems = [], []
      tags.each { |tag| threads << Thread.new {
          map[tag] = lc_problems(true, lc_tag_uri_of(tag))
          problems += map[tag]
          print "\033[1A \r #{map.size} of #{tags.length}                                       \n"
          $stdout.flush
        }
      }
      threads.each { |t| t.join }
      @updating = false
      write_json_file "lc_problems", { :problems => problems }
      write_json_file "lc_tags_problems_map", map
    end
    map
  end

  def update_lc_data
    return if @updating
    clear_data
    lc_tags_problems_map true
  end

  def clear_data
    write_json_file "lc_problems", {}
    write_json_file "lc_tags", {}
    write_json_file "lc_tags_problems_map", {}
  end

  private 

  def get_dom_from_uri(uri)
    page = Curl.get(uri)
    body = Nokogiri::HTML(page.body_str).xpath('//body')
  end

  def lc_tag_uri_of(tag)
    LEETCODE_URI_TAG + tag + '/'
  end

  def file_directory
    File.join(File.dirname(File.expand_path(__FILE__)), '/data/')
  end

  def write_json_file(file_name, map)
    File.open(file_directory + file_name + ".json", 'w') do |f|
      f.write(map.to_json)
    end
  end

  def read_json_file(file_name)
    map = {}
    File.open(file_directory + file_name + ".json", 'r') do |f|
      map = JSON.parse(f.read)
    end
    return map
  end
end