#/bin/bash

# Need a token with `user-library-modify` scope

source /etc/environment

current_track_id=$(mpc --format "%file%" | head -n 1 | awk -F ":" '{ print $3 }')
current_track_name=$(mpc --format "%title%" | head -n 1)

[ -z "$SPOTIFY_USER_LIBRARY_MODIFY_TOKEN" ] && notify-send "Could not save song. Please specify a SPOTIFY_USER_LIBRARY_MODIFY_TOKEN in /etc/environment"

status=$(curl -X "PUT" "https://api.spotify.com/v1/me/tracks?ids=$current_track_id" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $SPOTIFY_USER_LIBRARY_MODIFY_TOKEN" -w '%{http_code}')

if [ $status -eq 200 ]; then
  notify-send "❤️  Loved $current_track_name on Spotify 🎵"
  break
else
  notify-send "💔 Couldn't love $current_track_name, Got $status" | tr '\n' ' '
  break
fi
