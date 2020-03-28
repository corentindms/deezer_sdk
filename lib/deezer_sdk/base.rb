module DeezerSdk
  class Base
    include HTTParty
    base_uri 'https://api.deezer.com'

    attr_accessor :token

    def initialize(access_token)
      @access_token = access_token
    end

    protected

    def base_options
      {
        query: {
          access_token: @access_token
        }
      }
    end

    def get(path, options = {})
      self.class.get(path, options.deep_merge(base_options))
    end

    def get_paginated(path, accum = [], &block)
      loop do
        response = get(path).parsed_response
        accum += yield(response)

        next_url = next_url(response)
        break unless next_url

        path = next_url
      end

      accum
    end

    def next_url(response)
      return nil unless response["next"]

      response["next"].gsub(self.class.base_uri, '')
    end

    def post(path, options = {})
      self.class.post(path, options.deep_merge(base_options))
    end

    def delete(path, options = {})
      self.class.delete(path, options.deep_merge(base_options))
    end
  end
end