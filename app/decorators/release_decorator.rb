class ReleaseDecorator < BaseDecorator
  def display_tracklist
    to_html(tracklist)
  end

  def display_credits
    to_html(credits)
  end
end
