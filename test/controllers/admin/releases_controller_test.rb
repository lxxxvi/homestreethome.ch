require 'test_helper'

class Admin::ReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @release = releases(:bustin)
  end

  test 'should get index' do
    sign_in
    get admin_releases_path
    assert_response :success
  end

  test 'should get edit' do
    sign_in
    get edit_admin_release_path(@release)
    assert_response :success
  end

  test 'should update release' do
    sign_in
    patch admin_release_path(@release), params: release_params
    assert_redirected_to edit_admin_release_path(@release)
  end

  test 'should destroy release' do
    sign_in
    assert_difference('Release.archived.count', 1) do
      delete admin_release_path(@release)
    end

    assert_redirected_to admin_releases_path
  end

  private

  def release_params
    {
      admin_release: {
        download_path: 'https://hsh003.zip',
        bandcamp_path: '',
        published: '1'
      }
    }
  end
end
