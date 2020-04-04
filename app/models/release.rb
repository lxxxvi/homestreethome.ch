class Release < ApplicationRecord
  validates :discogs_release_id, :catalog_number, :artist, :title, :released_on, :tracklist, presence: true
  validates :discogs_release_id, :catalog_number, uniqueness: true
end
