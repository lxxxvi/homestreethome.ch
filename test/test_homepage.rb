require_relative "./helper"

class TestHomepage < Minitest::Test
  context "homepage" do
    setup do
      page = site.collections.pages.resources.find { |doc| doc.relative_url == "/" }
      document_root page
    end

    should "exist" do
      assert_select "body"
      assert_select "div", "home street home records"
      assert_select "div", "We're a music label based in Aarau, Switzerland."
      assert_select "h2", "Latest release"
      assert_select "h2", "Previous releases"
      assert_select "a", /Brebaje De Brujas/
      assert_select "li", minimum: 10
    end
  end

  context "hsh001" do
    setup do
      page = site.collections.releases.resources.find { |doc| doc.relative_url == "/releases/HSH001/" }
      document_root page
    end

    should "exist" do
      assert_select "body"

      assert_select "a", "Back to overview"

      assert_select "div", "home street home records"
      assert_select "div", "We're a music label based in Aarau, Switzerland."
      assert_select "h1", "Home Street Home"
      assert_select "h2", "Bustin' Through The Ceiling"
      assert_select "time", "2014-02-01"

      assert_select "section#tracklist" do
        assert_select "li", count: 20
      end

      assert_select "section#links" do
        assert_select "a", "Discogs"
        assert_select "a", "Bandcamp"
      end
    end
  end
end
