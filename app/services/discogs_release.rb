class DiscogsRelease
  HOME_STREET_HOME_RECORDS_NAME = 'Home Street Home Records'.freeze

  def initialize(discogs_release_id)
    @discogs_release_id = discogs_release_id
  end

  def home_street_home_release?
    discogs_release_result&.labels&.any? { |label| label.name == HOME_STREET_HOME_RECORDS_NAME }
  end

  def to_release
    Release.find_or_initialize_by(discogs_release_id: @discogs_release_id).tap do |release|
      release.catalog_number = read_catalog_number
      release.artist = read_artist
      release.title = read_title
      release.image_url = read_image_url
      release.released_on = read_released_on
      release.tracklist = read_tracklist
      release.credits = read_credits
    end
  end

  def discogs_release_result
    @discogs_release_result ||= DISCOGS_WRAPPER.get_release(@discogs_release_id)
  end

  private

  def read_catalog_number
    discogs_release_result.labels.first.catno
  end

  def read_artist
    build_artists(discogs_release_result.artists)
  end

  def read_title
    discogs_release_result.title
  end

  def read_image_url
    discogs_release_result&.images&.first&.resource_url
  end

  def read_released_on
    year, month, day = discogs_release_result.released
                                             .split('-')
                                             .map(&:to_i)
                                             .reject(&:zero?)

    Date.new(year, month || 1, day || 1)
  end

  def read_tracklist
    discogs_release_result.tracklist.map(&method(:build_track_name)).join("\n")
  end

  def read_credits
    return if discogs_release_result.extraartists.nil?

    discogs_release_result.extraartists.map do |extra_artist|
      to_markdown_list_item("#{extra_artist.role} - #{extra_artist.name}")
    end.join("\n")
  end

  def build_track_name(track)
    position = track.position
    artist = build_artists(track.artists)
    title = track.title

    track_name = "#{position}. "
    track_name << "#{artist} - " unless artist.nil?
    track_name << title

    to_markdown_list_item(track_name)
  end

  def build_artists(artists)
    return if artists.nil?

    artists.map(&method(:build_joinable_artist)).join(' ')
  end

  def build_joinable_artist(artist)
    artist_name = clean_artist_name(artist.name)
    "#{artist_name} #{artist.join}".strip
  end

  def clean_artist_name(name)
    name.gsub(/\([0-9]+\)$/, '').strip
  end

  def to_markdown_list_item(text)
    "* #{text}"
  end
end
