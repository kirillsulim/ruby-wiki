class ItalicDecorator
  def self.decorate(text)
    text.gsub(/\\\\(.*?)\\\\/, '<i>\1</i>')
  end
end
