require 'test_helper'

class ReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @release = releases(:one)
  end

  test "should get index" do
    get releases_url
    assert_response :success
  end

  test "should get new" do
    get new_release_url
    assert_response :success
  end

  test "should create release" do
    assert_difference('Release.count') do
      post releases_url, params: { release: { artist: @release.artist, credits: @release.credits, discogs_url: @release.discogs_url, download_url: @release.download_url, name: @release.name, playlist: @release.playlist, released_on: @release.released_on } }
    end

    assert_redirected_to release_url(Release.last)
  end

  test "should show release" do
    get release_url(@release)
    assert_response :success
  end

  test "should get edit" do
    get edit_release_url(@release)
    assert_response :success
  end

  test "should update release" do
    patch release_url(@release), params: { release: { artist: @release.artist, credits: @release.credits, discogs_url: @release.discogs_url, download_url: @release.download_url, name: @release.name, playlist: @release.playlist, released_on: @release.released_on } }
    assert_redirected_to release_url(@release)
  end

  test "should destroy release" do
    assert_difference('Release.count', -1) do
      delete release_url(@release)
    end

    assert_redirected_to releases_url
  end
end
