require 'test_helper'

class ReleaseDeoratorTest < ActiveSupport::TestCase
  test '#display_tracklist' do
    release = Release.new(tracklist: "* 1. Track One\n* 2. Track Two")

    assert_equal "<ul>\n<li>1. Track One</li>\n<li>2. Track Two</li>\n</ul>\n",
                 release.decorate.display_tracklist
  end

  test '#display_credits' do
    release = Release.new(credits: '* Cover by - Artist')

    assert_equal "<ul>\n<li>Cover by - Artist</li>\n</ul>\n",
                 release.decorate.display_credits
  end
end
