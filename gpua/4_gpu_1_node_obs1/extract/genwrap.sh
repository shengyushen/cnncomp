rm -f recordfp recordbp record recordtat
touch recordtat
source gen.sh 8
source gen.sh 16
source gen.sh 32
source gen.sh 64
source gen.sh 128
source gen.sh 256

#source fitrecord.sh
paste index recordfp > fp
paste index recordbp > bp
paste index recordtat > tat

