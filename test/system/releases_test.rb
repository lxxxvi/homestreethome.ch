require 'application_system_test_case'

class ReleasesTest < ApplicationSystemTestCase
  setup do
    @release = releases(:bustin)
  end

  test '#index' do
    visit releases_path

    assert_selector '.hsh-logo', text: "Home\nStreet\nHome"
    assert release_list_items.count.positive?
  end

  test '#index displays only active releses' do
    visit releases_path

    assert_difference -> { release_list_items.count }, -1 do
      releases(:bustin).archive!
      refresh
    end
  end

  test '#show does display archived release' do
    visit release_path(@release)
    assert_selector '.hsh-release--title', text: "Bustin' Through The Ceiling"
  end

  test '#show does not display archived release' do
    @release.archive!

    assert_raises ActiveRecord::RecordNotFound do
      visit release_path(@release)
    end
  end

  private

  def release_list_items
    find_all('li.hsh-release')
  end
end
