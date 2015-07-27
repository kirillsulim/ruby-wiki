#require 'spec_helper'
require_relative '../../../app/models/text_decorators/bold_decorator'

describe BoldDecorator do
  describe "#decorate" do
    it "should decorate text to bold" do
      d = BoldDecorator.new
      text = "Just some **bold text** here"
      expect(d.decorate(text)).to eq("Just some <b>bold text</b> here")
    end

    it "should decorate many bold parts" do
      d = BoldDecorator.new
      text = "**Bold** here **bold** there"
      expect(d.decorate(text)).to eq("<b>Bold</b> here <b>bold</b> there")
    end
  end
end
