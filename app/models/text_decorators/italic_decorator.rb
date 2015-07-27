class ItalicDecorator
  def decorate(text)
    text.gsub(/\\\\(.*?)\\\\/, '<i>\1</i>')
  end
end
