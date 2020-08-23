require 'test_helper'

class Discogs::ReleasesControllerTest < ActionDispatch::IntegrationTest
  test '#create' do
    discogs_release_stub(5835903)

    assert_difference -> { Release.count }, 1 do
      post discogs_releases_path, params: { discogs_release: { discogs_release_id: 5835903 } }
    end

    follow_redirect!
    assert_response :success
  end

  test '#create with manual release id' do
    discogs_release_stub(5835903)

    assert_difference -> { Release.count }, 1 do
      post discogs_releases_path, params: { discogs_release: { manual_discogs_release_id: 5835903 } }
    end

    follow_redirect!
    assert_response :success
  end

  test '#create with wrong discogs release id' do
    discogs_label_releases_stubs
    discogs_release_stub(11223344)

    assert_no_difference -> { Release.count } do
      post discogs_releases_path, params: { discogs_release: { discogs_release_id: 11223344 } }
    end
    assert_response :success
  end

  test '#create with non-existent discogs release id' do
    discogs_label_releases_stubs
    discogs_release_not_found_stub(0)

    assert_no_difference -> { Release.count } do
      post discogs_releases_path, params: { discogs_release: { discogs_release_id: 0 } }
    end
    assert_response :success
  end
end
