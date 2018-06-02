var hexStringFromSolidity = "<PASTE THE SOLIDTY OUTPUT HERE>"

var z = convert(hexStringFromSolidity);


var convert = function hexToStr(hex) {
	var str = '';
	for (var i = 0; i < hex.length; i += 2) {
	   var v = parseInt(hex.substr(i, 2), 16);
	   if (v) str += String.fromCharCode(v);
	}

  	params = [];
	res = "";
	for (var i=0; i<= str.length; i++){
		if(str.charCodeAt(i) > 31){
			res = res + str[i];
		}
		else{
			params.push(res);
			res = "";
		}
	}
	params.pop();

  return params;
}