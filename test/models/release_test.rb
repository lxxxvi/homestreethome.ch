require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  test 'mandatory fields' do
    release = Release.new
    release.validate

    release.errors.messages.tap do |messages|
      assert_equal ["can't be blank"], messages[:catalog_number]
      assert_equal ["can't be blank"], messages[:artist]
      assert_equal ["can't be blank"], messages[:name]
      assert_equal ["can't be blank"], messages[:released_on]
      assert_equal ["can't be blank"], messages[:playlist]
    end
  end

  test 'uniqueness' do
    release = Release.new(catalog_number: 'HSH001')
    release.validate

    assert_equal ['has already been taken'], release.errors.messages[:catalog_number]
  end
end
