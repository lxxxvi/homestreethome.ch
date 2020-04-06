class BaseDecorator < SimpleDelegator
  def to_html(markdown)
    # rubocop:disable Rails/OutputSafety
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true).render(markdown || '').html_safe
    # rubocop:enable Rails/OutputSafety
  end
end
