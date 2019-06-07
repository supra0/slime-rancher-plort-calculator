#!/bin/bash
# Script for Slime Rancher that prints
# how many days it will take for the effects
# of plort market saturation to wear off

# Arg 1 - Plort type (lowercase)
# Arg 2 - Number of plorts sold

# ARG = Argument of logarithm
# BASE = Base of logarithm
# CAP = Plort saturation needed for halved price
# CAPVALS = Array containing the different plort saturation values'
# COLOR = Color of plort number output
# PLORT = Type of plort after uppercase -> lowercase conversion

NOCOLOR='\033[0m'
CAPVALS=(12 15 20 30 40 10000)

#convert arg1 to lowercase
PLORT=$(echo "$1" | tr '[:upper:]' '[:lower:]')

if [ "$PLORT" = "pink" ]; then
  CAP=${CAPVALS[4]}
  COLOR='\033[38;5;212m'
elif [ "$PLORT" = "rock" ]; then
  CAP=${CAPVALS[3]}
  COLOR='\033[38;5;33m'
elif [ "$PLORT" = "phosphor" ]; then
  CAP=${CAPVALS[3]}
  COLOR='\033[38;5;177m'
elif [ "$PLORT" = "tabby" ]; then
  CAP=${CAPVALS[3]}
  COLOR='\033[38;5;247m'
elif [ "$PLORT" = "rad" ]; then
  CAP=${CAPVALS[2]}
  COLOR='\033[38;5;10m'
elif [ "$PLORT" = "honey" ]; then
  CAP=${CAPVALS[2]}
  COLOR='\033[38;5;172m'
elif [ "$PLORT" = "boom" ]; then
  CAP=${CAPVALS[2]}
  COLOR='\033[38;5;160m'
elif [ "$PLORT" = "puddle" ]; then
  CAP=${CAPVALS[2]}
  COLOR='\033[38;5;45m'
elif [ "$PLORT" = "fire" ]; then
  CAP=${CAPVALS[2]}
  COLOR='\033[38;5;196m'
elif [ "$PLORT" = "crystal" ]; then
  CAP=${CAPVALS[1]}
  COLOR='\033[38;5;99m'
elif [ "$PLORT" = "quantum" ]; then
  CAP=${CAPVALS[1]}
  COLOR='\033[38;5;11m'
elif [ "$PLORT" = "dervish" ]; then
  CAP=${CAPVALS[0]}
  COLOR='\033[38;5;135m'
elif [ "$PLORT" = "hunter" ]; then
  CAP=${CAPVALS[1]}
  COLOR='\033[38;5;3 m'
elif [ "$PLORT" = "mosaic" ]; then
  CAP=${CAPVALS[0]}
  COLOR='\033[38;5;153m'
elif [ "$PLORT" = "tangle" ]; then
  CAP=${CAPVALS[0]}
  COLOR='\033[38;5;42m'
elif [ "$PLORT" = "saber" ]; then
  CAP=${CAPVALS[1]}
  COLOR='\033[38;5;143m'
elif [ "$PLORT" = "gold" ]; then
  CAP=${CAPVALS[5]}
  COLOR='\033[38;5;220m'
else
  echo "Invalid or no plort type entered. Terminating."
  exit
fi

echo -e "${COLOR}Plorts${NOCOLOR} sold:" $2

ARG=$(echo "$CAP/$2" | bc -l)
BASE=.75
ANSWER=$(echo "l($ARG)/l($BASE)" | bc -l)
echo "Days to return to cap:" $ANSWER
ARG=$(echo "1/$2" | bc -l)
ANSWER=$(echo "l($ARG)/l($BASE)" | bc -l)
echo "Days to return to normal:" $ANSWER
