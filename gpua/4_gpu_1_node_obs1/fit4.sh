rm -f f4.txt
touch f4.txt

cat sdf1|grep "(0).*(1).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "0 1 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(0).*(2).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "0 2 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(0).*(3).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "0 3 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(1).*(0).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "1 0 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(1).*(2).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "1 2 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(1).*(3).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "1 3 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(2).*(0).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "2 0 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(2).*(1).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "2 1 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(2).*(3).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "2 3 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(3).*(0).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "3 0 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(3).*(1).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "3 1 " >> f4.txt;gnuplot -p fit.gplt
cat sdf1|grep "(3).*(2).*PtoP"|awk -F, '{print $2 " " $12}' >p2p_ms_MB ;echo -n "3 2 " >> f4.txt;gnuplot -p fit.gplt

