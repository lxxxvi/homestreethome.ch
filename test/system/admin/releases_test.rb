require 'application_system_test_case'

class Admin::ReleasesTest < ApplicationSystemTestCase
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
    discogs_label_releases_stubs
    discogs_release_stub(5835903)

    sign_in
    visit admin_releases_url
    click_on 'Fetch Release From Discogs'

    select 'We Be To Beat What Key Be To Lock', from: 'Discogs Release'

    click_on 'Fetch Release From Discogs'

    assert_text 'Release was successfully created'
    click_on 'Back'
  end

  test 'creating a Release by providing the release id manually' do
    discogs_label_releases_stubs
    discogs_release_stub(5835903)

    sign_in
    click_on 'Fetch Release From Discogs'

    fill_in 'Manual Discogs Release ID', with: '5835903'
    click_on 'Fetch Release From Discogs'

    assert_text 'Release was successfully created'
    click_on 'Back'
  end

  test 'displays manual discogs release id input field, even if API returns none' do
    discogs_label_no_new_release_stub
    sign_in
    click_on 'Fetch Release From Discogs'

    assert has_field? 'Manual Discogs Release ID', type: 'text'
    assert_not has_field? 'Discogs Release', type: 'text', exact: true
  end

  test 'updating a Release' do
    sign_in
    visit admin_releases_url
    click_on 'Edit', match: :first

    fill_in 'Bandcamp URL', with: 'https://label.bandcamp.com/album/cool-music'
    check 'Published?'

    click_on 'Update Release'

    assert_text 'Release was successfully updated'
    click_on 'Back'
  end

  test 'archiving a Release' do
    sign_in
    visit admin_releases_url

    assert_changes -> { find_all('table tbody tr').count }, -1 do
      click_on 'Edit', match: :first
      click_on 'Archive release'

      assert_text 'Release was successfully archived.'
    end
  end
end
