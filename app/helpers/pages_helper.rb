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
end
