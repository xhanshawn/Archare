require 'spec_helper'


# When the test suite is run, then this test will not cause any errors, 
# even though no code has been implemented yet, 
# because we have marked the test as “pending” (an RSpec-specific command)

describe Archare do

	it 'should return introdution' do
		intro = Archare.introduce
    expect(intro).to eq("This is the gem for archare")

	end
end