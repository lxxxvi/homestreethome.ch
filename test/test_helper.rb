ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'webmock/minitest'
require 'stubs_helper'

WebMock.disable_net_connect!(allow_localhost: true,
                             allow: 'chromedriver.storage.googleapis.com')

class ActiveSupport::TestCase
  include StubsHelper

  parallelize(workers: :number_of_processors)

  fixtures :all

  def sign_in
    post admin_sessions_path, params: { password: 'default' }
    follow_redirect!
    assert_response :success
  end
end
