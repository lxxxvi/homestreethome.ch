require "test_helper"
require 'capybara/rails'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :rack_test

  private

  def sign_in
    visit new_admin_sessions_path
    fill_in 'Password', with: 'default'
    click_on 'Sign in'
  end
end
