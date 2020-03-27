# DeezerSdk

Deezer SDK is a ruby client gem used to intercat with the Deezer Web API.

With it, you can easily interact with the Deezer Web API to do things like creating a playlist, retrieving information on the user's playlists or tracks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deezer_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deezer_sdk

## Usage

To load the client, use this :
```ruby
client = DeezerSdk::Client.new(deezer_access_token)
```

where `deezer_access_token` is the oauth token retrieved for a given user. You can use the `Omniauth` gem with `omniauth_deezer` to easily authenticate to the web API.

### Retrieve the user's playlists

```ruby
client.playlists
```

it returns something like :
```ruby
[
    {
                "id" => 7272239964,
             "title" => "French Touch All-Star",
          "duration" => 11301,
            "public" => true,
    "is_loved_track" => false,
     "collaborative" => false,
         "nb_tracks" => 41,
              "fans" => 0,
              "link" => "https://www.deezer.com/playlist/7272239964",
           "picture" => "https://api.deezer.com/playlist/7272239964/image",
     "picture_small" => "https://e-cdns-images.dzcdn.net/images/cover//56x56-000000-80-0-0.jpg",
    "picture_medium" => "https://e-cdns-images.dzcdn.net/images/cover//250x250-000000-80-0-0.jpg",
       "picture_big" => "https://e-cdns-images.dzcdn.net/images/cover//500x500-000000-80-0-0.jpg",
        "picture_xl" => "https://e-cdns-images.dzcdn.net/images/cover//1000x1000-000000-80-0-0.jpg",
          "checksum" => "55745066b231aa227f68a3d7c5feb56d",
         "tracklist" => "https://api.deezer.com/playlist/7272239964/tracks",
     "creation_date" => "2020-02-18 10:44:07",
          "time_add" => 1582022647,
          "time_mod" => 1582022647,
           "creator" => {
               "id" => 13079811,
             "name" => "Tchococo59",
        "tracklist" => "https://api.deezer.com/user/13079811/flow",
             "type" => "user"
    },
              "type" => "playlist"
    }

    ...
]
```

### Find a playlist

```ruby
client.find_playlist(playlist_id)
```

it returns something like this
```ruby

{
                "id" => 7272239964,
             "title" => "French Touch All-Star",
       "description" => "",
          "duration" => 11301,
            "public" => true,
    "is_loved_track" => false,
     "collaborative" => false,
         "nb_tracks" => 41,
              "fans" => 0,
              "link" => "https://www.deezer.com/playlist/7272239964",
             "share" => "https://www.deezer.com/playlist/7272239964?utm_source=deezer&utm_content=playlist-7272239964&utm_term=13079811_1585311821&utm_medium=web",
           "picture" => "https://api.deezer.com/playlist/7272239964/image",
     "picture_small" => "https://cdns-images.dzcdn.net/images/cover//56x56-000000-80-0-0.jpg",
    "picture_medium" => "https://cdns-images.dzcdn.net/images/cover//250x250-000000-80-0-0.jpg",
       "picture_big" => "https://cdns-images.dzcdn.net/images/cover//500x500-000000-80-0-0.jpg",
        "picture_xl" => "https://cdns-images.dzcdn.net/images/cover//1000x1000-000000-80-0-0.jpg",
          "checksum" => "55745066b231aa227f68a3d7c5feb56d",
         "tracklist" => "https://api.deezer.com/playlist/7272239964/tracks",
     "creation_date" => "2020-02-18 10:44:07",
           "creator" => {
               "id" => 13079811,
             "name" => "Tchococo59",
        "tracklist" => "https://api.deezer.com/user/13079811/flow",
             "type" => "user"
    },
              "type" => "playlist",
            "tracks" => {
            "data" => [
             {
                                     "id" => 695110942,
                               "readable" => true,
                                  "title" => "Music Sounds Better With You (Radio Edit)",
                            "title_short" => "Music Sounds Better With You",
                          "title_version" => "(Radio Edit)",
                                   "link" => "https://www.deezer.com/track/695110942",
                               "duration" => 260,
                                   "rank" => 795152,
                        "explicit_lyrics" => false,
                "explicit_content_lyrics" => 0,
                 "explicit_content_cover" => 2,
                                "preview" => "https://cdns-preview-3.dzcdn.net/stream/c-324112c240435fb13ee7ed56919b18a0-3.mp3",
                               "time_add" => 1582019047,
                                 "artist" => {
                           "id" => 68540642,
                         "name" => "Stardust",
                         "link" => "https://www.deezer.com/artist/68540642",
                    "tracklist" => "https://api.deezer.com/artist/68540642/top?limit=50",
                         "type" => "artist"
                },
                                  "album" => {
                              "id" => 100030032,
                           "title" => "Music Sounds Better With You",
                           "cover" => "https://api.deezer.com/album/100030032/image",
                     "cover_small" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/56x56-000000-80-0-0.jpg",
                    "cover_medium" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/250x250-000000-80-0-0.jpg",
                       "cover_big" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/500x500-000000-80-0-0.jpg",
                        "cover_xl" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/1000x1000-000000-80-0-0.jpg",
                       "tracklist" => "https://api.deezer.com/album/100030032/tracks",
                            "type" => "album"
                },
                                   "type" => "track"
            },

            ...

            ]
        }
}
```

### Create a playlist

```ruby
client.create_playlist(title) #where title is the title of the playlist
```

it returns something like
```ruby
{
    "id" => 7437909644
}
```

where `id` is the id of the playlist you just created.

### Delete a playlist

```ruby
client.delete_playlist(playlist_id)
```

it returns something like
```ruby
true || false
```

### Playlist tracks

```ruby
client.playlist_tracks(playlist_id)
```

it returns something like
```ruby
[
    {
                             "id" => 695110942,
                       "readable" => true,
                          "title" => "Music Sounds Better With You (Radio Edit)",
                    "title_short" => "Music Sounds Better With You",
                  "title_version" => "(Radio Edit)",
                           "link" => "https://www.deezer.com/track/695110942",
                       "duration" => 260,
                           "rank" => 795152,
                "explicit_lyrics" => false,
        "explicit_content_lyrics" => 0,
         "explicit_content_cover" => 2,
                        "preview" => "https://cdns-preview-3.dzcdn.net/stream/c-324112c240435fb13ee7ed56919b18a0-3.mp3",
                       "time_add" => 1582019047,
                         "artist" => {
                        "id" => 68540642,
                      "name" => "Stardust",
                      "link" => "https://www.deezer.com/artist/68540642",
                   "picture" => "https://api.deezer.com/artist/68540642/image",
             "picture_small" => "https://e-cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/56x56-000000-80-0-0.jpg",
            "picture_medium" => "https://e-cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/250x250-000000-80-0-0.jpg",
               "picture_big" => "https://e-cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/500x500-000000-80-0-0.jpg",
                "picture_xl" => "https://e-cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/1000x1000-000000-80-0-0.jpg",
                 "tracklist" => "https://api.deezer.com/artist/68540642/top?limit=50",
                      "type" => "artist"
        },
                          "album" => {
                      "id" => 100030032,
                   "title" => "Music Sounds Better With You",
                   "cover" => "https://api.deezer.com/album/100030032/image",
             "cover_small" => "https://e-cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/56x56-000000-80-0-0.jpg",
            "cover_medium" => "https://e-cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/250x250-000000-80-0-0.jpg",
               "cover_big" => "https://e-cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/500x500-000000-80-0-0.jpg",
                "cover_xl" => "https://e-cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/1000x1000-000000-80-0-0.jpg",
               "tracklist" => "https://api.deezer.com/album/100030032/tracks",
                    "type" => "album"
        },
                           "type" => "track"
    },

    ...
]
```

### Add tracks to a playlist

```ruby
client.add_tracks_to_playlist(playlist_id, track_ids)
```
where `playlist_id` it the id of the playlist you want to add tracks to and `track_ids` is an array of the ids of the tracks you want to add.

it returns something like
```ruby
true || false
```


### Find a track

```ruby
client.find_track(track_id)
```

it returns something like
```ruby
{
                         "id" => 569166452,
                   "readable" => true,
                      "title" => "Pocket Piano (Orchestral Version)",
                "title_short" => "Pocket Piano (Orchestral Version)",
              "title_version" => "",
                       "isrc" => "FR0NT1801216",
                       "link" => "https://www.deezer.com/track/569166452",
                      "share" => "https://www.deezer.com/track/569166452?utm_source=deezer&utm_content=track-569166452&utm_term=13079811_1585312833&utm_medium=web",
                   "duration" => 260,
             "track_position" => 1,
                "disk_number" => 1,
                       "rank" => 138562,
               "release_date" => "2018-10-19",
            "explicit_lyrics" => false,
    "explicit_content_lyrics" => 0,
     "explicit_content_cover" => 2,
                    "preview" => "https://cdns-preview-3.dzcdn.net/stream/c-33072a69ed8a5868dcd362e0eb11b2d2-3.mp3",
                        "bpm" => 115.81,
                       "gain" => -11,
                       "available_countries" => [
                        "AE",
                        ...,
                       ],
                       "artist" => {
                    "id" => 5047501,
                  "name" => "Orchestre Lamoureux",
                  "link" => "https://www.deezer.com/artist/5047501",
                 "share" => "https://www.deezer.com/artist/5047501?utm_source=deezer&utm_content=artist-5047501&utm_term=13079811_1585312833&utm_medium=web",
               "picture" => "https://api.deezer.com/artist/5047501/image",
         "picture_small" => "https://e-cdns-images.dzcdn.net/images/artist/5b2755034c58f94abe0ddb264698706b/56x56-000000-80-0-0.jpg",
        "picture_medium" => "https://e-cdns-images.dzcdn.net/images/artist/5b2755034c58f94abe0ddb264698706b/250x250-000000-80-0-0.jpg",
           "picture_big" => "https://e-cdns-images.dzcdn.net/images/artist/5b2755034c58f94abe0ddb264698706b/500x500-000000-80-0-0.jpg",
            "picture_xl" => "https://e-cdns-images.dzcdn.net/images/artist/5b2755034c58f94abe0ddb264698706b/1000x1000-000000-80-0-0.jpg",
                 "radio" => true,
             "tracklist" => "https://api.deezer.com/artist/5047501/top?limit=50",
                  "type" => "artist"
    },
                      "album" => {
                  "id" => 75816392,
               "title" => "Pocket Piano (Orchestral Version)",
                "link" => "https://www.deezer.com/album/75816392",
               "cover" => "https://api.deezer.com/album/75816392/image",
         "cover_small" => "https://e-cdns-images.dzcdn.net/images/cover/f4afdc636defc63ce9698b19a3c6388d/56x56-000000-80-0-0.jpg",
        "cover_medium" => "https://e-cdns-images.dzcdn.net/images/cover/f4afdc636defc63ce9698b19a3c6388d/250x250-000000-80-0-0.jpg",
           "cover_big" => "https://e-cdns-images.dzcdn.net/images/cover/f4afdc636defc63ce9698b19a3c6388d/500x500-000000-80-0-0.jpg",
            "cover_xl" => "https://e-cdns-images.dzcdn.net/images/cover/f4afdc636defc63ce9698b19a3c6388d/1000x1000-000000-80-0-0.jpg",
        "release_date" => "2018-10-19",
           "tracklist" => "https://api.deezer.com/album/75816392/tracks",
                "type" => "album"
    },
                       "type" => "track"

}
```

### Search a track



```ruby
track_options = {
    name: "Music Sounds Better With You",
    artist: "Stardust",
    album: "Music Sounds Better With You"
}

client.search_track(track_options)
```

it returns something like
```ruby
[
    {
                             "id" => 695110942,
                       "readable" => true,
                          "title" => "Music Sounds Better With You (Radio Edit)",
                    "title_short" => "Music Sounds Better With You",
                  "title_version" => "(Radio Edit)",
                           "link" => "https://www.deezer.com/track/695110942",
                       "duration" => 260,
                           "rank" => 795152,
                "explicit_lyrics" => false,
        "explicit_content_lyrics" => 0,
         "explicit_content_cover" => 2,
                        "preview" => "https://cdns-preview-3.dzcdn.net/stream/c-324112c240435fb13ee7ed56919b18a0-3.mp3",
                         "artist" => {
                        "id" => 68540642,
                      "name" => "Stardust",
                      "link" => "https://www.deezer.com/artist/68540642",
                   "picture" => "https://api.deezer.com/artist/68540642/image",
             "picture_small" => "https://cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/56x56-000000-80-0-0.jpg",
            "picture_medium" => "https://cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/250x250-000000-80-0-0.jpg",
               "picture_big" => "https://cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/500x500-000000-80-0-0.jpg",
                "picture_xl" => "https://cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/1000x1000-000000-80-0-0.jpg",
                 "tracklist" => "https://api.deezer.com/artist/68540642/top?limit=50",
                      "type" => "artist"
        },
                          "album" => {
                      "id" => 100030032,
                   "title" => "Music Sounds Better With You",
                   "cover" => "https://api.deezer.com/album/100030032/image",
             "cover_small" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/56x56-000000-80-0-0.jpg",
            "cover_medium" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/250x250-000000-80-0-0.jpg",
               "cover_big" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/500x500-000000-80-0-0.jpg",
                "cover_xl" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/1000x1000-000000-80-0-0.jpg",
               "tracklist" => "https://api.deezer.com/album/100030032/tracks",
                    "type" => "album"
        },
                           "type" => "track"
    },
    {
                             "id" => 695110932,
                       "readable" => true,
                          "title" => "Music Sounds Better With You",
                    "title_short" => "Music Sounds Better With You",
                  "title_version" => "",
                           "link" => "https://www.deezer.com/track/695110932",
                       "duration" => 403,
                           "rank" => 556035,
                "explicit_lyrics" => false,
        "explicit_content_lyrics" => 0,
         "explicit_content_cover" => 2,
                        "preview" => "https://cdns-preview-a.dzcdn.net/stream/c-acb9bc3b9e2fdc99aa9b35cd473fc33a-3.mp3",
                         "artist" => {
                        "id" => 68540642,
                      "name" => "Stardust",
                      "link" => "https://www.deezer.com/artist/68540642",
                   "picture" => "https://api.deezer.com/artist/68540642/image",
             "picture_small" => "https://cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/56x56-000000-80-0-0.jpg",
            "picture_medium" => "https://cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/250x250-000000-80-0-0.jpg",
               "picture_big" => "https://cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/500x500-000000-80-0-0.jpg",
                "picture_xl" => "https://cdns-images.dzcdn.net/images/artist/2d6dd0062507fca8e7b6bd19b697271e/1000x1000-000000-80-0-0.jpg",
                 "tracklist" => "https://api.deezer.com/artist/68540642/top?limit=50",
                      "type" => "artist"
        },
                          "album" => {
                      "id" => 100030032,
                   "title" => "Music Sounds Better With You",
                   "cover" => "https://api.deezer.com/album/100030032/image",
             "cover_small" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/56x56-000000-80-0-0.jpg",
            "cover_medium" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/250x250-000000-80-0-0.jpg",
               "cover_big" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/500x500-000000-80-0-0.jpg",
                "cover_xl" => "https://cdns-images.dzcdn.net/images/cover/ee56e4b369c91ad8d2c9f7b419d5f600/1000x1000-000000-80-0-0.jpg",
               "tracklist" => "https://api.deezer.com/album/100030032/tracks",
                    "type" => "album"
        },
                           "type" => "track"
    },
    ...
]
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/corentindms/deezer_sdk.