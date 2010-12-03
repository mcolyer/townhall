require 'spec_helper'

describe Tag do
  before(:all) do
    @html = File.read(File.join(File.dirname(__FILE__), "..", "fixtures", "granicus_player.html"))
  end
  it "can parse a granicus media player for tags" do
    tags = Tag.create_tags_from_granicus_player(@html)
    tags.size.should == 40
  end
end
