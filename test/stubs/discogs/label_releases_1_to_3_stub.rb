module Discogs
  class LabelReleases1To3Stub < BaseStub
    PAGE_SIZE = 10

    def initialize
      @label_id = Rails.configuration.discogs[:home_street_home_label_id]
    end

    def url
      [
        'https://api.discogs.com/labels/',
        @label_id,
        '/releases?f=json',
        "&page=1&per_page=#{PAGE_SIZE}",
        '&token=',
        Rails.configuration.discogs[:api_token]
      ].join
    end

    def response_fixture_file_path
      "responses/discogs/label_#{@label_id}_releases_1_to_3.json"
    end
  end
end
