require 'spec_helper'

describe "crawler" do
  it 'should return Crawler instance' do
    crawler = Archare.crawler
    expect(crawler.class).to eq(Archare::Crawler)
  end

  it 'should return an array consists of all the algorithm problem names of leetcode without updating' do
    crawler = Archare.crawler
    problems = crawler.lc_problems true
    expect(problems.class).to eq(Array)
    # expect(problems.empty?).to be false
    # puts File.mtime("lib/archare/data/lc_problems.json")
  end

  it 'should return an array consists of all the tag names of leetcode algorithm problems without updating' do
    crawler = Archare.crawler
    tags = crawler.lc_tags
    expect(tags.class).to eq(Array)
    # puts File.mtime("lib/archare/data/lc_tags.json")
  end
  
  it 'should return a hash map consists of tag - problems maps' do
    crawler = Archare.crawler
    map = crawler.lc_tags_problems_map
    expect(map.class).to eq(Hash)
  end

  it 'should return a hash map consists of tag - problems maps' do
    crawler = Archare.crawler
    map = crawler.lc_tags_problems_map
    expect(map.class).to eq(Hash)
    # puts File.mtime("lib/archare/data/lc_tags_problems_map.json")
  end

  it 'should update data of leetcode' do 
    crawler = Archare.crawler
    crawler.update_lc_data
    # puts File.mtime("lib/archare/data/lc_tags.json")
    # puts File.mtime("lib/archare/data/lc_problems.json")
    # puts File.mtime("lib/archare/data/lc_tags_problems_map.json")
  end
end