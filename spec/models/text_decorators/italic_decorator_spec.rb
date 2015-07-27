#require 'spec_helper'
require_relative '../../../app/models/text_decorators/italic_decorator'

describe ItalicDecorator do
  describe "#decorate" do
    it "should decorate text to italic" do
      d = ItalicDecorator
      text = "Just some \\\\italic text\\\\ here"
      expect(d.decorate(text)).to eq("Just some <i>italic text</i> here")
    end

    it "should decorate many italic parts" do
      d = ItalicDecorator
      text = "\\\\Italic\\\\ here \\\\italic\\\\ there!"
      expect(d.decorate(text)).to eq("<i>Italic</i> here <i>italic</i> there!")
    end
  end
end
