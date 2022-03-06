function first(){
	let k1 = $("img[src*='logo.jpg']");
	let k2 = $("div#forheader img");
	k2.hide(5000).show(5000);
}
function second(){
    $("img:not(:first)").hide(5000);
}
function third(id,name, value){
	$("#"+id).attr(name,value);
}
function fourth(){
	$("img[src*='moto2.jpg']").css({'border':'3px solid #334433'}).animate({
		'border-width':'7px'},5000,function(){$("#img_2").fadeOut(5000)});
}
function fifth(){
	$("body").append("<p id='newparagraph'>Добавление тега Р </p>");
	$("#newparagraph").css({'color':'white'}).css({'background':'black'});
}