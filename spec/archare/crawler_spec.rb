require 'spec_helper'

describe "crawler" do
  let(:crawler) { Archare.crawler }

  it 'should return Crawler instance' do
    expect(crawler.class).to eq(Archare::Crawler)
  end

  it 'should update data of leetcode' do
    update_thread = Thread.new{ crawler.update_lc_data }
    test_thread = Thread.new{ 
      sleep(2)
      expect(crawler.update_lc_data).to eql nil
    }
    update_thread.join
    test_thread.join
  end

  it 'should return an array consists of all the algorithm problem names of leetcode without updating' do
    problems = crawler.lc_problems
    expect(problems.class).to eq(Array)
    expect(problems.empty?).to be false
  end

  it 'should return an array consists of all the tag names of leetcode algorithm problems without updating' do
    tags = crawler.lc_tags
    expect(tags.class).to eq(Array)
    expect(tags.empty?).to be false
  end
  
  it 'should return a hash map consists of tag - problems maps' do
    map = crawler.lc_tags_problems_map
    expect(map.class).to eq(Hash)
    expect(map.empty?).to be false
  end

  it 'should return a hash map consists of tag - problems maps' do
    map = crawler.lc_tags_problems_map
    expect(map.class).to eq(Hash)
    expect(map.empty?).to be false
  end
end