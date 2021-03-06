class Admin::ReleaseForm < ApplicationForm
  attr_reader :bandcamp_url, :published

  def initialize(object, params = {})
    super()
    @object = object
    @params = params

    @bandcamp_url = params[:bandcamp_url] || object.bandcamp_url
    @published = params[:published] || object.published?
  end

  def save
    return unless valid?

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
