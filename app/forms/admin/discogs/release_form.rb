class Admin::Discogs::ReleaseForm < ApplicationForm
  attr_reader :discogs_release_id

  validates :discogs_release_id, presence: true
  validates :discogs_release_id, numericality: { only_integer: true }
  validate :valid_home_street_home_release

  def initialize(object, params = {})
    @object = object
    @params = params

    @discogs_release_id = params[:discogs_release_id]
  end

  def save
    return unless valid?

    release = discogs_release.to_release
    release.save!
  end

  private

  def discogs_release
    @discogs_release ||= DiscogsRelease.new(discogs_release_id)
  end

  def valid_home_street_home_release
    return if errors.key?(:discogs_release_id)
    return if discogs_release.home_street_home_release?

    errors.add(:discogs_release_id, 'is not from Home Street Home Records')
  end
end
