function addCodeImage() { 
   document.getElementById("add_to_me").innerHTML+= 
	   "<img src='homephoto.jpg' alt='home'>";
}

function setImg(_src, _alt){
	var img = new Image(300, 200);
	img.src = _src;
	img.alt = _alt;
	document.body.appendChild(img);
}
function pictureMove(img_name){
				var tag = document.createElement("img");	
				
				tag.setAttribute("src", img_name);//set attribute(s) for tag
				tag.setAttribute("style", "border: 2px solid red");
				tag.setAttribute("name", "picture");
				tag.setAttribute("width", "200");
	tag.setAttribute("height", "120")
				
				document.getElementById("add_to_me").appendChild(tag);//add to page
				}







