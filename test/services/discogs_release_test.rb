require 'test_helper'

class DiscogsReleaseTest < ActiveSupport::TestCase
  test '#to_release for compilation' do
    discogs_release_stub(5835903)

    discogs_release = DiscogsRelease.new(5835903)
    release = discogs_release.to_release

    assert_equal 'HSH002', release.catalog_number
    assert_equal 'Home Street Home', release.artist
    assert_equal 'We Be To Beat What Key Be To Lock', release.title
    assert_match %r{https://img.discogs.com/.*/R-5835903-1404044169-4898.jpeg.jpg}, release.image_url
    assert_equal Date.new(2014, 6, 28), release.released_on
    assert_equal file_fixture('expected_tracklist_hsh002.txt').read.chomp, release.tracklist
    assert_equal '* Producer - Samplix', release.credits
  end

  test '#to_release for album' do
    discogs_release_stub(7579828)

    discogs_release = DiscogsRelease.new(7579828)

    release = discogs_release.to_release

    assert_equal 'HSH006', release.catalog_number
    assert_equal 'Tinu', release.artist
    assert_equal 'True Fruits', release.title
    assert_match %r{https://img.discogs.com/.*/R-7579828-1444466549-8708.jpeg.jpg}, release.image_url
    assert_equal Date.new(2015, 7, 11), release.released_on
    assert_equal file_fixture('expected_tracklist_hsh006.txt').read.chomp, release.tracklist
    assert_equal '* Mastered By - Samplix', release.credits
  end
end
