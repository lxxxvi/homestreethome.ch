class ReleasesExporter
  def as_json
    Release.active
           .published
           .ordered_antichronological
           .map(&method(:serialize))
           .to_json
  end

  private

  UNNUMBERED_LIST_PATTERN = /\n\* /.freeze

  # rubocop:disable Metrics/MethodLength
  def serialize(release)
    {
      id: release.id,
      discogs_release_id: release.discogs_release_id,
      catalog_number: release.catalog_number,
      artist: release.artist,
      title: release.title,
      image_url: release.image_url,
      released_on: release.released_on,
      tracklist: serialize_tracklist(release.tracklist),
      credits: serialize_credits(release.credits),
      bandcamp_url: release.bandcamp_url
    }
  end
  # rubocop:enable Metrics/MethodLength

  def serialize_tracklist(tracklist)
    markdown_list_to_array(tracklist)
  end

  def serialize_credits(credits)
    markdown_list_to_array(credits)
  end

  def markdown_list_to_array(markdown)
    return [] if markdown.nil?

    sanitized_markdown = "\n#{markdown.chomp}"

    process_markdown_list(sanitized_markdown)
  end

  def process_markdown_list(markdown)
    return process_unnumbered_list(markdown) if unnumbered_list?(markdown)

    markdown.split("\n").drop(1)
  end

  def process_unnumbered_list(markdown)
    markdown.split(UNNUMBERED_LIST_PATTERN).drop(1)
  end

  def unnumbered_list?(markdown)
    markdown.starts_with?(UNNUMBERED_LIST_PATTERN)
  end
end
