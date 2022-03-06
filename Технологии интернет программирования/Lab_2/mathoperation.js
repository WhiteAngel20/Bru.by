function getTriangleHypotenuse(leg1, leg2){
	leg1 = parseInt(leg1);
	leg2 = parseInt(leg2);
	var res = Math.sqrt(leg1**2 + leg2**2);
	console.log("Hypotenuse: " + res);
	alert(res);
}