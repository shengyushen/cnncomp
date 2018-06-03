rm -f recordfp recordbp record recordtat
touch recordtat
source gen2.scr 8
source gen2.scr 16
source gen2.scr 32
source gen2.scr 64
source gen2.scr 128
source gen2.scr 256

#source fitrecord.sh
paste index recordfp > fp
paste index recordbp > bp
paste index recordtat > tat

