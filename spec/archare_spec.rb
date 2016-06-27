require 'spec_helper'


# When the test suite is run, then this test will not cause any errors, 
# even though no code has been implemented yet, 
# because we have marked the test as “pending” (an RSpec-specific command)

describe Archare do

	it 'should return introdution' do
		intro = Archare.introduce
    expect(intro).to eq("This is the gem for archare")
	end

  it 'should return Crawler instance' do
    crawler = Archare.crawler
    expect(crawler.class).to eq(Archare::Crawler)
  end


  it 'should return all the algorithm problem names of leetcode' do
    crawler = Archare.crawler
    problems = crawler.lc_algorithm_problem
    expect(problems.class).to eq(Array)
  end
end