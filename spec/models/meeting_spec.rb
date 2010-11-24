require 'spec_helper'

describe Meeting do
  describe "validations" do
    subject do
      Factory.build(:meeting)
    end
    it "has a proper fixture" do
      should be_valid
    end
    it "must have a url" do
      subject.url = nil
      should_not be_valid
    end
    it "must have a valid url" do
      subject.meeting_date = "asdf"
      should_not be_valid
    end
    it "must have a meeting date" do
      subject.meeting_date = nil
      should_not be_valid
    end
    it "must have a valid meeting date" do
      subject.meeting_date = "asdf"
      should_not be_valid
    end
  end
  describe "url generation" do
    subject do
      Meeting.new
    end
    it "generates a proper url" do
      subject.meeting_date = "2010-07-15"
      subject.meeting_date.year.should == 2010
      subject.meeting_date.month.should == 7
      subject.meeting_date.day.should == 15
      subject.url.should match(/http:\/\/s3\.amazonaws\.com\/#{TownhallConfig.s3_bucket}\/meetings\/2010-07-15\/(.*?)\.webm/)
    end
  end
end
