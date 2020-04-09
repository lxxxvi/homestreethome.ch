class DiscogsSynchronizer
  def call
    Discogs::LabelRelease.new.label_releases.each do |discogs_label_release|
      discogs_release = Discogs::Release.new(discogs_label_release.id)
      release = discogs_release.to_release
      release.save!
    end
  end
end
