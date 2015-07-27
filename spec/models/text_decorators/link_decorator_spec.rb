#require 'spec_helper'
require_relative '../../../app/models/text_decorators/link_decorator'

describe LinkDecorator do
  describe "#decorate" do
    it "should decorate link" do
      d = LinkDecorator.new
      text = "Just some ((path/to/page link)) to page"
      expect(d.decorate(text)).to eq("Just some <a href='/path/to/page'>link</a> to page")
    end

    it "should decorate many links" do
      d = LinkDecorator.new
      text = "((one link one)) and ((two link two))"
      expect(d.decorate(text)).to eq("<a href='/one'>link one</a> and <a href='/two'>link two</a>")
    end
  end
end
