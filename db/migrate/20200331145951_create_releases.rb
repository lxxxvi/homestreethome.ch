class CreateReleases < ActiveRecord::Migration[6.0]
  def change
    create_table :releases do |t|
      t.integer :discogs_release_id, null: false, index: { unique: true }
      t.string :catalog_number, null: false, index: { unique: true }
      t.string :artist, null: false
      t.string :title, null: false
      t.string :image_url, null: true
      t.date :released_on, null: false
      t.text :tracklist, null: false
      t.text :credits, null: true
      t.string :bandcamp_url, null: true
      t.datetime :published_at, null: true

      t.timestamps
    end
  end
end
