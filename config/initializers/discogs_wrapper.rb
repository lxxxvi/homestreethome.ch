DISCOGS_WRAPPER_APP_NAME = 'HSH'
DISCOGS_WRAPPER = Discogs::Wrapper.new(DISCOGS_WRAPPER_APP_NAME, user_token: Rails.configuration.discogs_token)