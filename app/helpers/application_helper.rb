module ApplicationHelper
  def title
    title = [t(:name, scope: [:application])]
    if content_for?(:title)
      title <<"|"
      title << content_for(:title)
    end
    title.join(" ")
  end
end
