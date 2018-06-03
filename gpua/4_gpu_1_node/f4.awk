{
	     if($0~/Tesla V100-SXM2-16GB \(0\).*Tesla V100-SXM2-16GB \(0\).*Tesla V100-SXM2-16GB \(1\).*PtoP/) {print >> "0_1"}
	else if($0~/Tesla V100-SXM2-16GB \(0\).*Tesla V100-SXM2-16GB \(0\).*Tesla V100-SXM2-16GB \(2\).*PtoP/) {print >> "0_2"}
	else if($0~/Tesla V100-SXM2-16GB \(0\).*Tesla V100-SXM2-16GB \(0\).*Tesla V100-SXM2-16GB \(3\).*PtoP/) {print >> "0_3"}
	else if($0~/Tesla V100-SXM2-16GB \(1\).*Tesla V100-SXM2-16GB \(1\).*Tesla V100-SXM2-16GB \(0\).*PtoP/) {print >> "1_0"}
	else if($0~/Tesla V100-SXM2-16GB \(1\).*Tesla V100-SXM2-16GB \(1\).*Tesla V100-SXM2-16GB \(2\).*PtoP/) {print >> "1_2"}
	else if($0~/Tesla V100-SXM2-16GB \(1\).*Tesla V100-SXM2-16GB \(1\).*Tesla V100-SXM2-16GB \(3\).*PtoP/) {print >> "1_3"}
	else if($0~/Tesla V100-SXM2-16GB \(2\).*Tesla V100-SXM2-16GB \(2\).*Tesla V100-SXM2-16GB \(0\).*PtoP/) {print >> "2_0"}
	else if($0~/Tesla V100-SXM2-16GB \(2\).*Tesla V100-SXM2-16GB \(2\).*Tesla V100-SXM2-16GB \(1\).*PtoP/) {print >> "2_1"}
	else if($0~/Tesla V100-SXM2-16GB \(2\).*Tesla V100-SXM2-16GB \(2\).*Tesla V100-SXM2-16GB \(3\).*PtoP/) {print >> "2_3"}
	else if($0~/Tesla V100-SXM2-16GB \(3\).*Tesla V100-SXM2-16GB \(3\).*Tesla V100-SXM2-16GB \(0\).*PtoP/) {print >> "3_0"}
	else if($0~/Tesla V100-SXM2-16GB \(3\).*Tesla V100-SXM2-16GB \(3\).*Tesla V100-SXM2-16GB \(1\).*PtoP/) {print >> "3_1"}
	else if($0~/Tesla V100-SXM2-16GB \(3\).*Tesla V100-SXM2-16GB \(3\).*Tesla V100-SXM2-16GB \(2\).*PtoP/) {print >> "3_2"}
}
