function getRandomObj2(){
	var arr = ["Яблоко", "Апельсин", "Груша", "Лимон"];
	alert(arr[Math.random(0, arr.length-1)]);
}

let array_user;
function setArray(size){
	array_user = Array(parseInt(size));
}

function AddElement(_element){
	array_user.push(_element);
	document.getElementById('AB').value = "";
}

function showArray(){
	alert(array_user);
}

function showME(n, _show = (function(){
	console.log('In fnc');
})){
	for(var i=0;i<n;i++){
		console.log(i);
		
		_show();
	}
	alert("finish");
}
