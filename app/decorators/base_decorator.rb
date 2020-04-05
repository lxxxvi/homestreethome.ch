class BaseDecorator < SimpleDelegator
  def to_html(markdown = '')
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true).render(markdown).html_safe
  end
end
