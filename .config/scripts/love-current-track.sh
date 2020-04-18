#/bin/bash

# Need a token with `user-library-modify` scope
# How to get a valid token from the CLI
#
# npm install -g spotify-auth-cli
# spotify-token --scope=user-library-modify

touch ~/.spotify_token
source ~/.spotify_token

current_track_id=$(mpc --format "%file%" | head -n 1 | awk -F ":" '{ print $3 }')
current_track_name=$(mpc --format "%title%" | head -n 1)

result=$(curl -X "PUT" "https://api.spotify.com/v1/me/tracks?ids=$current_track_id" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $SPOTIFY_USER_LIBRARY_MODIFY_TOKEN" | jq)


error=$(echo $result | jq .error.message)
status=$(echo $result | jq .error.status)

echo $error
if [ -z "$error" ]; then
  notify-send "❤️  Loved $current_track_name on Spotify 🎵"
  break
else
  notify-send "💔 Couldn't love $current_track_name, $error [$status]" | tr '\n' ' '
  if [ $status -eq 401 ]; then
    token=$(spotify-token --scope=user-library-modify | gawk '{split($0,a); print a[4]}' | head -2 | tail -1)
    echo "SPOTIFY_USER_LIBRARY_MODIFY_TOKEN=$token" > ~/.spotify_token
    notify-send "New token received, retrying"
    $("$0")
  fi
fi

