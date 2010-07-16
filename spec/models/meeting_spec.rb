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
end
