#!/bin/bash

API_KEY="d9b47f3f48563b443d5c4504f09b9071"
CITY_ID="4710178"
UNITS="imperial"  # Use "imperial" for Fahrenheit

weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?id=$CITY_ID&units=$UNITS&appid=$API_KEY")

if [ ! -z "$weather" ]; then
    temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    echo "${temp}°"
else
    echo "N/A"
fi
