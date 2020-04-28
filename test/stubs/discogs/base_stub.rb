module Discogs
  class BaseStub
    StubStruct = Struct.new(:url, :request_headers, :response_fixture_file_path, :response_status)

    def stub_struct
      StubStruct.new(url, request_headers, response_fixture_file_path)
    end

    def url
      raise 'implement in subclass'
    end

    def search_endpoint
      'https://api.discogs.com/database/search'
    end

    def request_headers
      {
        'Accept' => 'application/json',
        'Accept-Encoding' => 'gzip,deflate',
        'User-Agent' => DISCOGS_WRAPPER_APP_NAME
      }
    end

    def response_fixture_file_path
      raise 'implement in subclass'
    end

    def response_status
      200 # override if necessary
    end
  end
end
