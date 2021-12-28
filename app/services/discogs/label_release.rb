class Discogs::LabelRelease
  def initialize
    @label_id = Rails.configuration.discogs[:home_street_home_label_id]
  end

  def all
    @all ||= fetch_all
  end

  def missing
    existing_discogs_release_ids = Release.pluck(:discogs_release_id)
    all.reject do |release|
      existing_discogs_release_ids.include?(release.id)
    end
  end

  private

  def fetch_all
    page = 1
    result = DISCOGS_WRAPPER.get_label_releases(@label_id, page:, per_page: 10)

    releases = result.releases

    while page < result.pagination.pages
      page += 1
      releases += DISCOGS_WRAPPER.get_label_releases(@label_id, page:, per_page: 10).releases
    end

    releases
  end
end
