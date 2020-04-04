require 'application_system_test_case'

class ReleasesTest < ApplicationSystemTestCase
  setup do
    @release = releases(:bustin)
  end

  test 'no access without signing in' do
    visit admin_releases_url
    assert_selector 'h1', text: 'Releases', count: 0
    assert_selector 'input[type=submit]' do |element|
      assert_equal 'Sign in', element[:value]
    end
  end

  test 'visiting the index' do
    sign_in
    visit admin_releases_url
    assert_selector 'h1', text: 'Releases'
  end

  test 'creating a Release' do
    discogs_release_stub(5835903)

    sign_in
    visit admin_releases_url
    click_on 'New Release From Discogs'

    fill_in 'Discogs Release ID', with: '5835903'

    click_on 'Create Release'

    assert_text 'Release was successfully created'
    click_on 'Back'
  end

  test 'updating a Release' do
    sign_in
    visit admin_releases_url
    click_on 'Edit', match: :first

    fill_in 'Download URL', with: 'https://hsh009.zip'
    fill_in 'Bandcamp URL', with: 'https://label.bandcamp.com/album/cool-music'
    check 'Published?'

    click_on 'Update Release'

    assert_text 'Release was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Release' do
    sign_in
    visit admin_releases_url
    click_on 'Destroy', match: :first

    assert_text 'Release was successfully destroyed'
  end
end
