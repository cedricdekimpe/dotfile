pacman -Qu | wc -l | sed -e '/^0$/d' > ~/.pacupgrnum
number_of_packages=$(cat ~/.pacupgrnum | sed -e "/^$/d")
if [ $number_of_packages > 0 ]; then
  notify-send "$number_of_packages updates available"
fi
