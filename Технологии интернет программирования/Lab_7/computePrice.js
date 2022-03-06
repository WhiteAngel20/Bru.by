//
var priceByHours = [];
var priceByLang = [];
var priceByReporting = [];

function getTotalPrice(){
	
				 //[[hours], [lang], [report]]
	var aboutInfo =[["36-info", "64-info", "128-info"],
			 		["ru-info", "en-info"],
					["report-ex-info", "report-off-info"]];
	var aboutDB =  [["36-db", "64-db", "128-db"],
					["ru-lg-db", "en-lg-db"],
					["report-ex-db", "report-off-db"]];
	var aboutWide = [["36-wd", "64-wd", "128-wd"],
					 ["ru-lg-wd", "en-lg-wd"],
					 ["report-ex-wd", "report-off-wd"]];
	var aboutLogic= [["36-lg", "64-lg", "128-lg"],
					 ["ru-lg", "en-lg"],
					 ["report-ex-lg", "report-off-lg"]];
	var all = [aboutInfo, aboutDB, aboutWide, aboutLogic];
	
	for(var i=0; i< all.length;i++){
		getInformaticPrices(all[i]);	
	}
	
	setPriceInfo();
	setPriceDB();
	setPriceLG();
	setPriceWD();
	getAllPrice();
}
function getInformaticPrices(_id){
	var d = document;
	
	var is_36 = d.getElementById(_id[0][0]).checked;
	var is_64 = d.getElementById(_id[0][1]).checked;
	var is_128 = d.getElementById(_id[0][2]).checked;
	var listforCheck = [is_36, is_64, is_128];
	
	//duration 36/64/128
	for(var i = 0; i<listforCheck.length; i++){
		if(checkOnClick(listforCheck[i])){
			var value_ = d.getElementById(_id[0][i]).value;
			priceByHours.push(parseInt(value_));
			break;
		}
	}
	
	var is_rus = d.getElementById(_id[1][0]).checked;
	var is_en = d.getElementById(_id[1][1]).checked;
	listforCheck = [is_rus, is_en];
	
	//language ru/en
	for(var i = 0; i<listforCheck.length; i++){
		if(checkOnClick(listforCheck[i])){
			var value_ = d.getElementById(_id[1][i]).value;
			priceByLang.push(parseInt(value_));
			break;
		}
	}
	
	var is_exam = d.getElementById(_id[2][0]).checked;
	var is_offset = d.getElementById(_id[2][1]).checked;
	listforCheck = [is_exam, is_offset];
	
	//reporting exam/offset
	for(var i=0; i<listforCheck.length; i++){
		if(checkOnClick(listforCheck[i])){
			var _value = d.getElementById(_id[2][i]).value;
			priceByReporting.push(parseInt(_value));
			break;
		}
	}
}
function checkOnClick(isClick){
	if(isClick) return true;
	else return false;
}

function clearAllSheetInfo(){
	var x = 0;
}

//calculete total price by last columns
function getTotalPriceInfo(){
	return sum(0);
}
function getTotalPriceDB(){
	return sum(1);
}
function getTotalPriceWD(){
	return sum(2);
}
function getTotalPriceLG(){
	return sum(3);
}
function sum(poss){
	return priceByHours[poss] + priceByLang[poss] + priceByReporting[poss];
}


//set vaue in HTML doc
function setPriceInfo(){
	document.getElementById("totalPriceInfo").value =getTotalPriceInfo()+" y.e";
}
function setPriceDB(){
	document.getElementById("totalPriceDB").value=getTotalPriceDB()+" y.e";
}
function setPriceWD(){
	document.getElementById("totalPriceWD").value=getTotalPriceWD()+" y.e";
}
function setPriceLG(){
	document.getElementById("totalPriceLG").value=getTotalPriceLG()+" y.e";
}

//caltulate all price
function getAllPrice(){
	var summa = getTotalPriceInfo() + getTotalPriceDB()+getTotalPriceLG()+getTotalPriceWD();
	document.getElementById("allPrice").value=summa+" y.e";
}























