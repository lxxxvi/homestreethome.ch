require 'test_helper'

class DiscogsSynchronizerTest < ActiveSupport::TestCase
  test '#call' do
    discogs_label_releases_1_to_3_stubs
    discogs_release_stub(5303073) # HSH001
    discogs_release_stub(5835903) # HSH002
    discogs_release_stub(6224255) # HSH003

    release = releases(:bustin)
    release.update(
      catalog_number: 'HSH123',
      artist: 'Warius Artist',
      title: 'Bastin tru da ceelin',
      image_url: nil,
      released_on: Date.new(2030, 1, 1),
      tracklist: '1. None',
      credits: 'Yes'
    )

    assert_difference -> { Release.count }, 1, 'should have added HSH003' do
      DiscogsSynchronizer.new.call
    end

    release.reload

    assert_equal 'HSH001', release.catalog_number
    assert_equal 'Home Street Home', release.artist
    assert_equal "Bustin' Through The Ceiling", release.title
    assert_match(/jpg$/, release.image_url)
    assert_equal Date.new(2014, 2, 1), release.released_on
    assert release.tracklist.include?('ill Figure - Outro')
    assert_equal '', release.credits
  end
end
