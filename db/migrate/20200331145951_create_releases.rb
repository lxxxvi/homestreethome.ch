class CreateReleases < ActiveRecord::Migration[6.0]
  def change
    create_table :releases do |t|
      t.string :catalog_number, null: false, index: { unique: true }
      t.string :artist, null: false
      t.string :name, null: false
      t.date :released_on, null: false
      t.text :playlist, null: false
      t.text :credits, null: true
      t.string :download_url, null: true
      t.string :discogs_url, null: true
      t.string :bandcamp_url, null: true
      t.datetime :published_at, null: true

      t.timestamps
    end
  end
end
