require_relative '../models/text_decorators/bold_decorator'
require_relative '../models/text_decorators/italic_decorator'
require_relative '../models/text_decorators/link_decorator'
require_relative '../models/text_decorators/new_line_decorator'

module PagesHelper
  # Expect {p1 => {}, p2 => {p2sub => {} } }
  def recursive_tree(roots)
    result = ""
    roots.each do |key, subpages|
      result += "<li><a href='/#{key.full_name}'>#{key.title}</a><ul>" +
        recursive_tree(subpages) +
        "</ul></li>"
    end
    result
  end

  @@decorators = [
    BoldDecorator,
    ItalicDecorator,
    LinkDecorator,
    NewLineDecorator,
  ]

  def decorate(text)
    result = text
    @@decorators.each do |decorator|
      result = decorator.decorate(result)
    end
    result
  end
end
