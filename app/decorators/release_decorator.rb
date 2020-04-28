class ReleaseDecorator < BaseDecorator
  DISCOGS_RELEASE_BASE_URL = 'https://www.discogs.com/release'.freeze

  def display_tracklist
    to_html(tracklist)
  end

  def display_credits
    to_html(credits)
  end

  def discogs_url
    "#{DISCOGS_RELEASE_BASE_URL}/#{discogs_release_id}"
  end
end
