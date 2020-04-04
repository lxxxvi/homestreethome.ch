require 'stubs/discogs/base_stub'
require 'stubs/discogs/release_stub'

module DiscogsStubs
  def discogs_release_stub(discogs_release_id)
    to_stub(Discogs::ReleaseStub.new(discogs_release_id).stub_struct)
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
