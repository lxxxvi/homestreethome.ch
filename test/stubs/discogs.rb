require 'stubs/discogs/base_stub'
require 'stubs/discogs/label_releases_stub'
require 'stubs/discogs/label_releases_1_to_3_stub'
require 'stubs/discogs/release_stub'
require 'stubs/discogs/release_not_found_stub'

module DiscogsStubs
  def discogs_label_releases_stubs
    to_stub(Discogs::LabelReleasesStub.new(page: 1).stub_struct)
    to_stub(Discogs::LabelReleasesStub.new(page: 2).stub_struct)
  end

  def discogs_label_releases_1_to_3_stubs
    to_stub(Discogs::LabelReleases1To3Stub.new.stub_struct)
  end

  def discogs_release_stub(discogs_release_id)
    to_stub(Discogs::ReleaseStub.new(discogs_release_id).stub_struct)
  end

  def discogs_release_not_found_stub(discogs_release_id)
    to_stub(Discogs::ReleaseNotFoundStub.new(discogs_release_id).stub_struct)
  end

  def to_stub(stub_struct)
    stub_request(:get, stub_struct.url)
      .with(headers: stub_struct.request_headers)
      .to_return(
        status: stub_struct.response_status,
        body: file_fixture(stub_struct.response_fixture_file_path).read,
        headers: {}
      )
  end
end
