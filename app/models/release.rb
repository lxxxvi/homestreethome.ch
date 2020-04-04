class Release < ApplicationRecord
  validates :discogs_release_id, :catalog_number, :artist, :title, :released_on, :tracklist, presence: true
  validates :discogs_release_id, :catalog_number, uniqueness: true

  scope :ordered_by_release_date, -> { order(released_on: :desc) }

  def published?
    published_at.present?
  end
end
