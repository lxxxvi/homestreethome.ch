class DiscogsLabelReleases
  def initialize
    @label_id = Rails.configuration.discogs[:home_street_home_label_id]
  end

  def label_releases
    @label_releases ||= fetch_label_releases
  end

  def missing_label_releases
    existing_discogs_release_ids = Release.pluck(:discogs_release_id)
    label_releases.reject do |release|
      existing_discogs_release_ids.include?(release.id)
    end
  end

  private

  def fetch_label_releases
    page = 1
    result = DISCOGS_WRAPPER.get_label_releases(@label_id, page: page, per_page: 10)

    releases = result.releases

    while page < result.pagination.pages
      page += 1
      releases += DISCOGS_WRAPPER.get_label_releases(@label_id, page: page, per_page: 10).releases
    end

    releases
  end
end
