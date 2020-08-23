require 'test_helper'

class ReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @release = releases(:bustin)
  end

  test 'should get index' do
    get releases_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_release_path(@release)
    assert_response :success
  end

  test 'should update release' do
    patch release_path(@release), params: release_params
    assert_redirected_to edit_release_path(@release)
  end

  test 'should destroy release' do
    assert_difference('Release.archived.count', 1) do
      delete release_path(@release)
    end

    assert_redirected_to releases_path
  end

  private

  def release_params
    {
      release: {
        download_path: 'https://hsh003.zip',
        bandcamp_path: '',
        published: '1'
      }
    }
  end
end
