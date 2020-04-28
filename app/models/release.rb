class Release < ApplicationRecord
  validates :discogs_release_id, :catalog_number, :artist, :title, :released_on, :tracklist, presence: true
  validates :discogs_release_id, :catalog_number, uniqueness: true

  before_save :sanitize_catalog_number

  scope :active, -> { where(archived_at: nil) }
  scope :archived, -> { where.not(archived_at: nil) }
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

  def archive!
    update!(archived_at: Time.zone.now)
  end

  private

  def sanitize_catalog_number
    self.catalog_number = catalog_number.gsub(/[^[:alnum:]]/, '')
  end
end
