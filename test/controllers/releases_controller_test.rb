require 'test_helper'

class ReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @release = releases(:bustin)
  end

  test "should get index" do
    sign_in
    get admin_releases_path
    assert_response :success
  end

  test "should get new" do
    sign_in
    get new_admin_release_path
    assert_response :success
  end

  test "should create release" do
    sign_in
    assert_difference('Release.count') do
      post admin_releases_path, params: release_params
    end

    assert_redirected_to admin_release_path(Release.last)
  end

  test "should show release" do
    sign_in
    get admin_release_path(@release)
    assert_response :success
  end

  test "should get edit" do
    sign_in
    get edit_admin_release_path(@release)
    assert_response :success
  end

  test "should update release" do
    sign_in
    patch admin_release_path(@release), params: release_params
    assert_redirected_to admin_release_path(@release)
  end

  test "should destroy release" do
    sign_in
    assert_difference('Release.count', -1) do
      delete admin_release_path(@release)
    end

    assert_redirected_to admin_releases_path
  end

  private

  def release_params
    {
      release: {
        catalog_number: 'HSH033',
        artist: 'Betty',
        name: 'Bluesy Betty',
        released_on: '25/04/2020',
        playlist: '1. Track',
        credits: 'Cover by Tina',
        discogs_path: 'https://discogs.com/releases/222',
        download_path: 'https://hsh003.zip',
        bandcamp_path: ''
      }
    }
  end
end
