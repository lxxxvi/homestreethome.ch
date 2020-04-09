require 'test_helper'

class DiscogsLabelReleasesTest < ActiveSupport::TestCase
  test '#label_releases' do
    discogs_label_releases_stubs

    label_releases = DiscogsLabelReleases.new.label_releases
    assert_equal 16, label_releases.count
  end

  test '#missing_label_releases' do
    discogs_label_releases_stubs

    missing_label_releases = DiscogsLabelReleases.new.missing_label_releases
    assert_equal 13, missing_label_releases.count
  end
end
