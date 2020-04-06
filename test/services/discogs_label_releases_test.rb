require 'test_helper'

class DiscogsLabelReleasesTest < ActiveSupport::TestCase
  test '#all_releases' do
    discogs_label_releases_stubs

    all_releases = DiscogsLabelReleases.new.all_releases
    assert_equal 16, all_releases.count
  end

  test '#missing_releases' do
    discogs_label_releases_stubs

    missing_releases = DiscogsLabelReleases.new.missing_releases
    assert_equal 13, missing_releases.count
  end
end
