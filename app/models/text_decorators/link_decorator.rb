class LinkDecorator
  def decorate(text)
    text.gsub(/\(\(((\w+)(\/\w+)*) (.+?)\)\)/, "<a href='/\\1'>\\4</a>")
  end
end
