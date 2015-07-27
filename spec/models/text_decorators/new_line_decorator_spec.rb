#require 'spec_helper'
require_relative '../../../app/models/text_decorators/new_line_decorator'

describe NewLineDecorator do
  describe "#decorate" do
    it "should insert br tag" do
      d = NewLineDecorator
      text = "Text\nwith\nnew\nlines\n!"
      expect(d.decorate(text)).to eq("Text<br/>with<br/>new<br/>lines<br/>!")
    end
  end
end
