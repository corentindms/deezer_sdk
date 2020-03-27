require "deezer_sdk/version"
require "httparty"
require "deep_merge"

module DeezerSdk
  class Error < StandardError; end

  class Client
    include HTTParty
    base_uri 'https://api.deezer.com'

    attr_accessor :token

    def initialize(access_token)
      @access_token = access_token
    end

    def playlists
      get("/user/me/playlists")["data"]
    end

    def find_playlist(id)
      get("/playlist/#{id}").parsed_response
    end

    def create_playlist(title)
      post("/user/me/playlists", body: { title: title }).parsed_response
    end

    def delete_playlist(id)
      delete("/playlist/#{id}").parsed_response
    end

    def playlist_tracks(playlist_id)
      get("/playlist/#{playlist_id}/tracks")["data"]
    end

    def add_tracks_to_playlist(playlist_id, track_ids)
      options = {
        query: {
          songs: track_ids.join(",")
        }
      }

      post("/playlist/#{playlist_id}/tracks", options).parsed_response
    end

    def find_track(id)
      get("/track/#{id}").parsed_response
    end

    def search_track(track)
      search_options = {
        query: {
          q: "track:\"#{track[:name]}\" artist:\"#{track[:artists]}\" album:\"#{track[:album]}\""
        }
      }

      response = get("/search/track", search_options)
      response.parsed_response["data"]
    end

    private

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

    def post(path, options = {})
      self.class.post(path, options.deep_merge(base_options))
    end

    def delete(path, options = {})
      self.class.delete(path, options.deep_merge(base_options))
    end
  end

end
