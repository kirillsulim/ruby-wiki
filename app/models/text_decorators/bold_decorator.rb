class BoldDecorator
  def decorate(text)
    text.gsub(/\*\*(.*?)\*\*/, '<b>\1</b>')
  end
end
