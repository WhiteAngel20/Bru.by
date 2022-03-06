function getNumber(num){
	num = parseInt(num);
	var isyoung = (num>18) ? true : false;
	if(isyoung){
		//enter password
		var isparantscontrol = 
			("123456" == setpassword()) ? true : false;

		if(isparantscontrol){
			alert("Welcome");
		}
		else{
			alert("PASSWORD IS FAIL");
		}

	}
	else{
		correcttetxt();
	}
}

function setpassword(){
	return document.getElementById("psswd").value;
}

function correcttetxt(){
	alert("Sign fail");
}
function createMatrix(){
	var sizeM = 8;
	var i = 0, j =0;
	var str1 = [];
	for(i=0;i<sizeM;i++){
		for(j=0; j<sizeM;j++){
			if(i%2==0 && j%2==0){
				str1.push("#");
			}
			else{
				str1.push(" ");
			}
			if(i%2==1 && j%2==1){
				str1.push("#");
			}
			else{
				str1.push(" ");
			}
		}
	}
	var iter = 0, temp="";
	for(i=0;i<sizeM;i++){
		for(j=0;j<sizeM;j++){
			temp+=str1[iter++];
		}
		console.log(temp);
		temp="";
	}
}