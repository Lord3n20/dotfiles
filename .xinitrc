cd ~

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

while true; do
	exec ./.fehbg &
	sleep 300
done &

exec picom & #--blur-method=gaussian --blur-deviation=10 &

while true; do
	xsetroot -name "`cat /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp2_input | awk '{ print substr( $0, 1, length($0)-3 ) }'`°C `cat /proc/acpi/ibm/fan | grep level | awk '{print $2}' | head -n 1` `cat /sys/class/power_supply/BAT0/capacity`% `cat /sys/class/power_supply/BAT0/status` `date +'%H:%M %d.%m.%y'`"
	sleep 10
done &

setxkbmap de

exec thorium-browser &
exec vencord-desktop &

exec dwm
