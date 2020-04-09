class DiscogsSynchronizer
  def call
    DiscogsLabelReleases.new.label_releases.each do |discogs_label_release|
      discogs_release = DiscogsRelease.new(discogs_label_release.id)
      release = discogs_release.to_release
      release.save!
    end
  end
end
