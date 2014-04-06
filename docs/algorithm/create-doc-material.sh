#!/bin/bash
# Before running this, run count_score in DEBUG mode

# Copy all debug images and resize them to smaller
cp ../../debug/* .
cp ../../testdata/real3.jpg testdata.jpg
mogrify -geometry 400x *.jpg

# Create straighten table animation
mkdir giftemp
cp large.jpg found_blue.jpg found_corners.jpg lower_long_side.jpg large_straight.jpg giftemp

python burn-text.py giftemp/large.jpg "1"
python burn-text.py giftemp/found_blue.jpg "2"
python burn-text.py giftemp/found_corners.jpg "3"
python burn-text.py giftemp/lower_long_side.jpg "4"
python burn-text.py giftemp/large_straight.jpg "5"

convert -delay 140 -loop 0 giftemp/large.jpg giftemp/found_blue.jpg giftemp/found_corners.jpg giftemp/lower_long_side.jpg giftemp/large_straight.jpg straighten-table.gif
convert straighten-table.gif \( -clone 0 -set delay 250 \) -swap 0 +delete \( +clone -set delay 250 \) +swap +delete straighten-table.gif

rm -r giftemp


