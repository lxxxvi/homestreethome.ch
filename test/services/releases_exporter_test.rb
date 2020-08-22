require 'test_helper'

class RelesesExporterTest < ActiveSupport::TestCase
  # rubocop:disable Metrics/BlockLength
  test '#as_json' do
    publish_releases

    json_result = ReleasesExporter.new.as_json

    result = JSON.parse(json_result)
    assert_equal 3, result.count

    # newest release
    result.first.tap do |newest_release|
      assert_equal 509675166, newest_release['id']
      assert_equal 13776867, newest_release['discogs_release_id']
      assert_equal 'HSH014', newest_release['catalog_number']
      assert_equal 'Various Artists', newest_release['artist']
      assert_equal 'Rumbled Raincoat Rumbled Face', newest_release['title']
      assert_match(/R-13776867-1560929803-7722.jpeg.jpg$/,
                   newest_release['image_url'])
      assert_equal '2019-06-15', newest_release['released_on']

      assert_equal 10, newest_release['tracklist'].count
      assert_equal "C1. slik nik - Comin'", newest_release['tracklist'].first
      assert_equal 'C10. Ra Pius - Naviherz', newest_release['tracklist'].last

      assert_equal 1, newest_release['credits'].count
      assert_equal 'Artwork by Irma', newest_release['credits'].first
    end

    # oldest release
    result.last.tap do |oldest_release|
      assert_equal 831206149, oldest_release['id']
      assert_equal 5303073, oldest_release['discogs_release_id']
      assert_equal 'HSH001', oldest_release['catalog_number']
      assert_equal 'Various Artists', oldest_release['artist']
      assert_equal "Bustin' Through The Ceiling", oldest_release['title']
      assert_match(/R-5303073-1390056310-2222.jpeg.jpg$/,
                   oldest_release['image_url'])
      assert_equal '2014-02-01', oldest_release['released_on']

      assert_equal 20, oldest_release['tracklist'].count
      assert_equal "1. Samplix & DJ 4tex - Intro (Bustin') (0:51)",
                   oldest_release['tracklist'].first
      assert_equal '20. ill Figure - Outro (See You Soon) (1:56)',
                   oldest_release['tracklist'].last

      assert_equal [], oldest_release['credits']
    end
  end
  # rubocop:enable Metrics/BlockLength

  private

  def publish_releases
    releases(:chue, :rumbled).each do |release|
      release.update(published_at: Time.zone.now)
    end
  end
end
