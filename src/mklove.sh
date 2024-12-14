date "+Compiled: %Y/%m/%d %H:%M:%S" > version.txt
rm ../SMPiano.love
zip -9 -r -x\.git/* ../SMPiano.love .