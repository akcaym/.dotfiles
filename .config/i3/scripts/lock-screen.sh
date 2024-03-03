#!/bin/sh

BLANK='#00000000'
CLEAR='#f5e0dc'
DEFAULT='#cdd6f4'
TEXT='#cdd6f4'
WRONG='#eba0ac'
VERIFYING='#89b4fa'
KEYHL='#a6e3a1'

i3lock-custom \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$KEYHL         \
--bshl-color=$KEYHL          \
\
--screen 1                   \
--blur 9                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \
--keylayout 1                \
--verif-text="..." \
#--image ~/.config/i3/wallpapers/wallpaper \

