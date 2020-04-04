class Admin::ReleaseForm < ApplicationForm
  attr_reader :download_url, :bandcamp_url, :published

  def initialize(object, params = {})
    @object = object
    @params = params

    @download_url = params[:download_url] || object.download_url
    @bandcamp_url = params[:bandcamp_url] || object.bandcamp_url
    @published = params[:published] || object.published?
  end

  def save
    return unless valid?

    object.download_url = download_url
    object.bandcamp_url = bandcamp_url
    object.published_at = published_to_published_at
    object.save!
  end

  private

  def published_to_published_at
    return Time.zone.now if published.to_i.positive?

    nil
  end
end
