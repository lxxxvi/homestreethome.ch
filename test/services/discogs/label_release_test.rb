require 'test_helper'

class Discogs::LabelReleaseTest < ActiveSupport::TestCase
  test '#all' do
    discogs_label_releases_stubs

    label_releases = Discogs::LabelRelease.new.all
    assert_equal 16, label_releases.count
  end

  test '#missing' do
    discogs_label_releases_stubs

    missing = Discogs::LabelRelease.new.missing
    assert_equal 13, missing.count
  end
end
