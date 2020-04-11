require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  test 'mandatory fields' do
    release = Release.new
    release.validate

    release.errors.messages.tap do |messages|
      assert_equal ["can't be blank"], messages[:discogs_release_id]
      assert_equal ["can't be blank"], messages[:catalog_number]
      assert_equal ["can't be blank"], messages[:artist]
      assert_equal ["can't be blank"], messages[:title]
      assert_equal ["can't be blank"], messages[:released_on]
      assert_equal ["can't be blank"], messages[:tracklist]
    end
  end

  test 'uniqueness discogs_release_id' do
    release = Release.new(discogs_release_id: 5303073)
    release.validate
    assert_equal ['has already been taken'], release.errors.messages[:discogs_release_id]
  end

  test 'uniqueness catalog_number' do
    release = Release.new(catalog_number: 'HSH001')
    release.validate
    assert_equal ['has already been taken'], release.errors.messages[:catalog_number]
  end

  test '#sanitize_catalog_number' do
    release = releases(:bustin)

    release.update(catalog_number: 'HSH    001')
    release.reload
    assert_equal 'HSH001', release.catalog_number
  end

  test '.active and .archived' do
    release = releases(:bustin)

    assert_difference -> { Release.active.count }, -1 do
      assert_difference -> { Release.archived.count }, 1 do
        release.archive!
      end
    end

    assert_difference -> { Release.archived.count }, -1 do
      assert_difference -> { Release.active.count }, 1 do
        release.update!(archived_at: nil)
      end
    end
  end
end
