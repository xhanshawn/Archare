require 'spec_helper'


# When the test suite is run, then this test will not cause any errors, 
# even though no code has been implemented yet, 
# because we have marked the test as “pending” (an RSpec-specific command)

describe Archare do

	it 'should puts introdution' do
		intro = Archare.introduce
	end

  it 'should return Crawler instance' do
    crawler = Archare.crawler
    expect(crawler.class).to eq(Archare::Crawler)
  end


  # it 'should return an array consists of all the algorithm problem names of leetcode' do
  #   crawler = Archare.crawler
  #   problems = crawler.lc_problems
  #   expect(problems.class).to eq(Array)
  # end

  # it 'should return an array consists of all the tag names of leetcode algorithm problems' do
  #   crawler = Archare.crawler
  #   tags = crawler.lc_tags
  #   expect(tags.class).to eq(Array)
  # end

  # it 'should return a hash map consists of tag - problems maps' do
  #   crawler = Archare.crawler
  #   map = crawler.lc_tags_problems_map
  #   expect(map.class).to eq(Hash)

  #   puts map
  # end


  # it 'should update the tag_problem_map json file' do
  #   crawler = Archare.crawler
  #   crawler.update_lc_data
  # end
end