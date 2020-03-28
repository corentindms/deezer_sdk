module DeezerSdk
  class Client < Base
    def playlists
      get_paginated("/user/me/playlists") { |response| response["data"] }
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
      get_paginated("/playlist/#{playlist_id}/tracks") { |response| response["data"] }
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
  end
end