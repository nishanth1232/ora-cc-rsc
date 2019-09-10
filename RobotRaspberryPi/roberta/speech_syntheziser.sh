#!/bin/bash

#The text and urls for Text to Speech (TTS)
text="$1"

#German TTS
# original # url="https://nm-sprachass.iais.fraunhofer.de/tts_server_de/"
url="localhost:8091"
#English TTS
#url="https://nm-sprachass.iais.fraunhofer.de/tts_server/"


#Urlencoder the text using python (e.g. replace spaces with %20)
text=$(python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])" "$text")

#Curl the TTS and play mp3 (mpg123 is needed for audio play)
curl -X GET ${url}/synthesize?text="${text}" | mpg123 -

