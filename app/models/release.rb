class Release < ApplicationRecord
  validates :discogs_release_id, :catalog_number, :artist, :name, :released_on, :playlist, presence: true
  validates :discogs_release_id, :catalog_number, uniqueness: true
end
