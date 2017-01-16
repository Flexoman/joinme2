module Joinme2
  module Configuration
    AUTH_URI = 'https://secure.join.me/api/public/v1/auth/oauth2'.freeze
    AUTH_REFRESH_TOKEN_URI = 'https://secure.join.me/api/public/v1/auth/token'.freeze
    BASE_URI = 'https://api.join.me/v1/'.freeze
    API_KEY = nil
    REDIRECT_URI = nil
    CLIENT_ID = nil
    CLIENT_SECRET = nil
    DEFAULT_SCOPES = 'user_info scheduler start_meeting'.freeze
    RESPONSE_TYPE = 'token'.freeze

    VALID_ACCESSORS = [:base_uri,
                       :default_scopes,
                       :redirect_uri,
                       :client_id,
                       :client_secret,
                       :auth_uri,
                       :auth_refresh_token_uri,
                       :response_type].freeze

    attr_accessor *VALID_ACCESSORS

    def configure
      yield self
    end

    def options
      VALID_ACCESSORS.inject({}) do |accessor, key|
        accessor.merge!(key => send(key))
      end
    end

    def self.extended(mod)
      mod.set_defaults
    end

    def set_defaults
      self.base_uri = BASE_URI
      self.default_scopes = DEFAULT_SCOPES
      self.redirect_uri = REDIRECT_URI
      self.client_id = CLIENT_ID
      self.client_secret = CLIENT_SECRET
      self.auth_uri = AUTH_URI
      self.auth_refresh_token_uri = AUTH_REFRESH_TOKEN_URI
      self.response_type = RESPONSE_TYPE
    end
  end
end
