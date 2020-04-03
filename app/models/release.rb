class Release < ApplicationRecord
  validates :catalog_number, :artist, :name, :released_on, :playlist, presence: true
  validates :catalog_number, uniqueness: true
end
