class Release < ApplicationRecord
  validates :discogs_release_id, :catalog_number, :artist, :title, :released_on, :tracklist, presence: true
  validates :discogs_release_id, :catalog_number, uniqueness: true

  scope :published, -> { where.not(published_at: nil) }
  scope :ordered_antichronological, -> { order(released_on: :desc) }

  def published?
    published_at.present?
  end

  def decorate
    @decorate ||= ReleaseDecorator.new(self)
  end

  def to_param
    catalog_number
  end
end
