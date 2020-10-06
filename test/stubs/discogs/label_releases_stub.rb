module Discogs
  class LabelReleasesStub < BaseStub
    PAGE_SIZE = 10

    def initialize(page:)
      super()
      @page = page
      @label_id = Rails.configuration.discogs[:home_street_home_label_id]
    end

    def url
      [
        'https://api.discogs.com/labels/',
        @label_id,
        '/releases?f=json',
        "&page=#{@page}&per_page=#{PAGE_SIZE}",
        '&token=',
        Rails.configuration.discogs[:api_token]
      ].join
    end

    def response_fixture_file_path
      "responses/discogs/label_#{@label_id}_releases_page_#{@page}.json"
    end
  end
end
