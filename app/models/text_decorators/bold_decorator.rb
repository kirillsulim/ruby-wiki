class BoldDecorator
  def self.decorate(text)
    text.gsub(/\*\*(.*?)\*\*/, '<b>\1</b>')
  end
end
