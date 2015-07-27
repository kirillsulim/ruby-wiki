class NewLineDecorator
  def self.decorate(text)
    text.gsub(/\n/, "<br/>")
  end
end
