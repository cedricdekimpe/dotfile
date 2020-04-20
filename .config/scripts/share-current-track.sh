#/bin/bash
echo "https://combine.fm/$(mpc --format "%file%" | head -n 1 | awk -F ":" '{ print $1 }')/track/$(mpc --format "%file%" | head -n 1 | awk -F ":" '{ print $3 }')" | xclip -selection clipboard && notify-send "Copied to clipboard"
