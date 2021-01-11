# nate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
WITH_TRAY="false"
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "true" = "$WITH_TRAY" ]; then
      MONITOR=$m polybar --reload top-with-tray >> /tmp/$m-topbar.log 2>&1 &
    else
      MONITOR=$m polybar --reload top >> /tmp/$m-topbar.log 2>&1 &
      WITH_TRAY="true"
    fi
  done
else
  polybar --reload top >> /tmp/topbar.log 2>&1 &
fi
# polybar top >>/tmp/topbar.log 2>&1 &
#polybar bottom >>/tmp/bottombar.log 2>&1 &

echo "Bars launched..."
