#!/usr/bin/env bash

CHOICE=$1

TEMP_XRANDR_QUERY_FILE=/tmp/handle-monitors.txt
APPLICATION_PATH=/usr/bin
XRANDR_PATH=$APPLICATION_PATH/xrandr

function get_xrandr_query(){
  # check_if_xrandr_installed
  if [[ ! -e $XRANDR_PATH ]]; then
    echo -e "You must first install 'xrandr' to use handle-monitors.sh"
    exit 84
  fi

  xrandr --query > $TEMP_XRANDR_QUERY_FILE
}

function set_edp(){
  echo "setting monitor for $CHOICE"
  xrandr --output HDMI-1-0 --off
  xrandr --output eDP --auto --primary
}

function set_hdmi(){
  echo "setting monitor for $CHOICE"
}

function set_dual(){
  echo "setting monitor for $CHOICE"

  # check if HDMI connected
  if (grep "^HDMI-1-0 connected" $TEMP_XRANDR_QUERY_FILE > /dev/null);  then
    echo "HDMI-1-0 is connected"
    xrandr --output HDMI-1-0 --auto --primary --left-of eDP
  else
    echo "HDMI-1-0 is NOT connected"
    #xrandr --output eDP --auto --primary
    set_edp
  fi
}


if [ $# = 1 ]; then

  get_xrandr_query

  case "$CHOICE" in
       eDP) set_edp  ;;
      HDMI) set_hdmi ;;
      Dual) set_dual ;;
      *) echo "'$CHOICE' is not a valid parameter!!! Only--> [eDP],[HDMI],[Dual]"  ;;
  esac
else
  echo "UsageError: Only 1 argument at a time!"
fi

