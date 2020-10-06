class Admin::Discogs::ReleaseForm < ApplicationForm
  attr_reader :discogs_release_id

  validates :discogs_release_id, presence: true
  validates :discogs_release_id, numericality: { only_integer: true }
  validate :valid_home_street_home_release

  def initialize(object, params = {})
    super()
    @object = object
    @params = params

    @discogs_release_id = params[:discogs_release_id].presence || params[:manual_discogs_release_id].presence
  end

  def missing_label_releases
    @missing_label_releases ||= Discogs::LabelRelease.new.missing
  end

  def missing_label_releases_options
    missing_label_releases.sort_by(&:id).map do |missing_release|
      option_label = missing_release.artist
      option_label += " - #{missing_release.title}"
      option_label += " (#{missing_release.catno})" if missing_release.catno.present?
      [option_label, missing_release.id]
    end
  end

  def save
    return unless valid?

    object.attributes = discogs_release.to_release.attributes
    object.save!
  end

  private

  def discogs_release
    @discogs_release ||= Discogs::Release.new(discogs_release_id)
  end

  def valid_home_street_home_release
    return if errors.key?(:discogs_release_id)
    return if discogs_release.home_street_home_release?

    errors.add(:discogs_release_id, 'is not from Home Street Home Records')
  end
end
