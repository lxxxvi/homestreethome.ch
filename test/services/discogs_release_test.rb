require 'test_helper'

class DiscogsReleaseTest < ActiveSupport::TestCase
  test '#to_release' do
    discogs_release_stub(5835903)

    discogs_release = DiscogsRelease.new(5835903)
    release = discogs_release.to_release

    assert_equal 'HSH002', release.catalog_number
    assert_equal 'Home Street Home', release.artist
    assert_equal 'We Be To Beat What Key Be To Lock', release.title
    assert_match expected_image_url_pattern, release.image_url
    assert_equal Date.new(2014, 6, 28), release.released_on
    assert_equal expected_tracklist.chomp, release.tracklist
    assert_equal expected_credits, release.credits
  end

  private

  def expected_image_url_pattern
    %r{https://img.discogs.com/.*/R-5835903-1404044169-4898.jpeg.jpg}
  end

  def expected_tracklist
    file_fixture('expected_tracklist_hsh002.txt').read
  end

  def expected_credits
    'Producer - Samplix'
  end
end
