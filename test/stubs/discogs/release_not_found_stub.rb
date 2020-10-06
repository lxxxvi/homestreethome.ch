module Discogs
  class ReleaseNotFoundStub < BaseStub
    def initialize(discogs_release_id)
      super()
      @discogs_release_id = discogs_release_id
    end

    def url
      [
        'https://api.discogs.com/releases/',
        @discogs_release_id,
        '?f=json&token=',
        Rails.configuration.discogs[:api_token]
      ].join
    end

    def response_fixture_file_path
      'responses/discogs/release_not_found.json'
    end

    def response_status
      404
    end
  end
end
