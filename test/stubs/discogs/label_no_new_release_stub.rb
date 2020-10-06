module Discogs
  class LabelNoNewReleaseStub < BaseStub
    def initialize
      super
      @label_id = Rails.configuration.discogs[:home_street_home_label_id]
    end

    def url
      [
        'https://api.discogs.com/labels/',
        @label_id,
        '/releases?f=json',
        '&page=1&per_page=10',
        '&token=',
        Rails.configuration.discogs[:api_token]
      ].join
    end

    def response_fixture_file_path
      "responses/discogs/label_#{@label_id}_no_new_release.json"
    end
  end
end
