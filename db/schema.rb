# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_31_145951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "releases", force: :cascade do |t|
    t.integer "discogs_release_id", null: false
    t.string "catalog_number", null: false
    t.string "artist", null: false
    t.string "title", null: false
    t.string "image_url"
    t.date "released_on", null: false
    t.text "tracklist", null: false
    t.text "credits"
    t.string "download_url"
    t.string "bandcamp_url"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_number"], name: "index_releases_on_catalog_number", unique: true
    t.index ["discogs_release_id"], name: "index_releases_on_discogs_release_id", unique: true
  end

end
