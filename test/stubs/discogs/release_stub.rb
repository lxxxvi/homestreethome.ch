module Discogs
  class ReleaseStub < BaseStub
    def initialize(discogs_release_id)
      @discogs_release_id = discogs_release_id
    end

    def url
      "https://api.discogs.com/releases/#{@discogs_release_id}?f=json&token=#{Rails.configuration.discogs_token}"
    end

    def response_fixture_file_path
      "responses/discogs/release_#{@discogs_release_id}.json"
    end
  end
end
