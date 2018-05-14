BEGIN {
	inputx=ix;
	inputy=iy;
	inputd=id;
	bytePerParm=bpp;

	print "inputx " inputx;
	print "inputy " inputy;
	print "inputd " inputd;
	print "bytePerParm " bytePerParm;

}

{
	if($1 ~ /^#/) {
	} else if (NF==0) {
	} else {
		oldlayer=layer;
		oldsublayer=sublayer;
		layer=$1;
		sublayer=$2;
		type=$3;
		if (type=="conv") {
			filterx=$4;
			filtery=$5;
			filternum=$6;
			stride=$7;
			newinputx=inputx/stride;
			newinputy=inputy/stride;
			newinputd=filternum;
			
			parameter_num=filterx*filtery*inputd*filternum;
			parameter_sz=parameter_num*bytePerParm;
			flop=parameter_num*newinputx*newinputy;
			fetmem=newinputx*newinputy*newinputd*bytePerParm;

			print "\nlayer " layer " " sublayer " " type " : ";
			print "parameter size " parameter_sz;
			print "flop           " flop;
			print "fetmem         " fetmem;
			print "output         " newinputx "*" newinputy "*" newinputd;
			
		} else if (type=="maxpool") {
			filterx=$4;
			filtery=$5;
			stride=$6;

			newinputx=inputx/stride;
			newinputy=inputy/stride;
			newinputd=inputd;
			
			parameter_sz=0;
			flop=newinputx*newinputy*newinputd*filterx*filtery;
			fetmem=newinputx*newinputy*newinputd*bytePerParm;
			print "\nlayer " layer " " sublayer " " type " : ";
			print "parameter size " parameter_sz;
			print "flop           " flop;
			print "fetmem         " fetmem;
			print "output         " newinputx "*" newinputy "*" newinputd;
		} else if (type=="downsam") {
			stride=$4;
			newinputx=inputx/stride;
			newinputy=inputy/stride;
			newinputd=inputd;

			parameter_sz=0;
			flop=newinputx*newinputy*newinputd;
			fetmem=newinputx*newinputy*newinputd*bytePerParm;
			print "\nlayer " layer " " sublayer " " type " : ";
			print "parameter size " parameter_sz;
			print "flop           " flop;
			print "fetmem         " fetmem;
			print "output         " newinputx "*" newinputy "*" newinputd;
		} else if (type=="avgpool") {
			newinputx=inputx;
			newinputy=inputy;
			newinputd=inputd;

			parameter_sz=0;
			flop=newinputx*newinputy*newinputd;
			fetmem=newinputx*newinputy*newinputd*bytePerParm;
			print "\nlayer " layer " " sublayer " " type " : ";
			print "parameter size " parameter_sz;
			print "flop           " flop;
			print "fetmem         " fetmem;
			print "output         " newinputx "*" newinputy "*" newinputd;
			
		} else if (type=="gblpool") {
			newinputx=1;
			newinputy=1;
			newinputd=inputd;

			parameter_sz=0;
			flop=inputx*inputy*newinputd;
			fetmem=newinputx*newinputy*newinputd*bytePerParm;
			print "\nlayer " layer " " sublayer " " type " : ";
			print "parameter size " parameter_sz;
			print "flop           " flop;
			print "fetmem         " fetmem;
			print "output         " newinputx "*" newinputy "*" newinputd;
		} else if (type=="fc") {	
			width = $4;
			newinputx=inputx;
			newinputy=inputy;
			newinputd=width;
			parameter_num=newinputx*newinputy*newinputd*inputx*inputy*inputd;
			parameter_sz=parameter_num*bytePerParm;
			flop=parameter_num;
			fetmem=newinputx*newinputy*newinputd*bytePerParm;
			print "\nlayer " layer " " sublayer " " type " : ";
			print "parameter size " parameter_sz;
			print "flop           " flop;
			print "fetmem         " fetmem;
			print "output         " newinputx "*" newinputy "*" newinputd;
		} else if(type =="relu") {
			# almost no parameter and flop, only feather 
			print "\nlayer " layer " " sublayer " " type " : ";
			fetmem=inputx*inputy*inputd*bytePerParm;
			print "fetmem         " fetmem;
		} else if(type =="lprj") {
			# combine each inputx*inputy plane to $4 planes 
			parameter_num=$4*inputd;
			parameter_sz=parameter_num*bytePerParm;
			flop=parameter_num*inputx*inputy;
			fetmem=$4*inputx*inputy*bytePerParm;
			print "\nlayer " layer " " sublayer " " type " : ";
			print "parameter size " parameter_sz;
			print "flop           " flop;
			print "fetmem         " fetmem;
#			print "inputd _4 " inputd " " $4 ;
		} else {
			print
		}
			inputx=newinputx;
			inputy=newinputy;
			inputd=newinputd;
	}
}

