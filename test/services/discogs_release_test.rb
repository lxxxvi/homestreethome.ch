require 'test_helper'

class DiscogsReleaseTest < ActiveSupport::TestCase
  test '#to_release' do
    discogs_release_stub(5835903)

    discogs_release = DiscogsRelease.new(5835903)
    release = discogs_release.to_release

    assert_equal 'HSH002', release.catalog_number
    assert_equal 'Home Street Home', release.artist
    assert_equal 'We Be To Beat What Key Be To Lock', release.title
    assert_match expected_image_url_pattern, release.image_url
    assert_equal Date.new(2014, 6, 28), release.released_on
    assert_equal expected_tracklist, release.tracklist
    assert_equal expected_credits, release.credits
  end

  private

  def expected_image_url_pattern
    %r{https://img.discogs.com/.*/R-5835903-1404044169-4898.jpeg.jpg}
  end

  def expected_tracklist
    "1. DJ Okay - We Be To Beat
2. Bustle Frog & Kneecap - Seasick In Croatia
3. ill Figure - Try And Error
4. DJ Okay - This And That Yaaa
5. Samplix - Jazznez
6. Bustle Frog - RawBin
7. Rob Chop The Vinylator - Dope Fantastic
8. Tinu - Remember
9. Knut Butter - Ech Fend Dech Wörklech Fresh
10. slik nik - Full Of Culture
11. Bustle Frog - Macanecca
12. Knut Butter - Relax And Float Downstream
13. Tinu - Sweet Smell Of Success
14. Kneecap - Pointless And Silly
15. ill Figure & DJ Okay - Pocket Science
16. Soulcrash - Jazzmine
17. Samplix - 4evaeva
18. slik nik - I Rum 2 Su
19. Rob Chop The Vinylator - Dandy"
  end

  def expected_credits
    "Producer - Samplix"
  end
end
