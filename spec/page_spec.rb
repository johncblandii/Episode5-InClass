require 'rspec'
require_relative '../db/setup'
require_relative "../models/page"

describe Page do 
	it "should know if it's at the end of the road" do
		subject.conclusion = true
		subject.end_of_road?.should eq(true)
	end

	context "#options" do
		subject{ Page.create }
		let(:option_a){option_a = Page.create(parent_id: subject.id) }
		let(:option_b){option_a = Page.create(parent_id: subject.id) }
		it "should have options for the next pages" do
			subject.options.should eq([option_a, option_b])
		end
	end
end