function clearAllInfo(){
	clearHours();
	clearUserData();
	clearLanguage();
	clearReporting();
	clearPrice();
}
function clearUserData(){
	document.getElementById("_lastname").value="";
	document.getElementById("_firstname").value="";
	document.getElementById("_middlename").value="";
	document.getElementById("_age").value="";
	document.getElementById("_address").value="";
	document.getElementById("_email").value="";	
}
function clearHours(){
	document.getElementById("36-info").checked=false;
	document.getElementById("64-info").checked=false;
	document.getElementById("128-info").checked=false;
	document.getElementById("36-db").checked=false;
	document.getElementById("64-db").checked=false;
	document.getElementById("128-db").checked=false;
	document.getElementById("36-wd").checked=false;
	document.getElementById("64-wd").checked=false;
	document.getElementById("128-wd").checked=false;
	document.getElementById("36-lg").checked=false;
	document.getElementById("64-lg").checked=false;
	document.getElementById("128-lg").checked=false;
}
function clearLanguage(){
	document.getElementById("ru-info").checked=false;
	document.getElementById("en-info").checked=false;
	document.getElementById("ru-lg-db").checked=false;
	document.getElementById("en-lg-db").checked=false;
	document.getElementById("ru-lg-wd").checked=false;
	document.getElementById("en-lg-wd").checked=false;
	document.getElementById("ru-lg").checked=false;
	document.getElementById("en-lg").checked=false;
}
function clearReporting(){
	document.getElementById("report-ex-info").checked=false;
	document.getElementById("report-off-info").checked=false;
	document.getElementById("report-ex-db").checked=false;
	document.getElementById("report-off-db").checked=false;
	document.getElementById("report-ex-wd").checked=false;
	document.getElementById("report-off-wd").checked=false;
	document.getElementById("report-ex-lg").checked=false;
	document.getElementById("report-off-lg").checked=false;
}
function clearPrice(){
	document.getElementById("totalPriceInfo").value="";
	document.getElementById("totalPriceDB").value="";
	document.getElementById("totalPriceWD").value="";
	document.getElementById("totalPriceLG").value="";
	document.getElementById("allPrice").value="";
}
