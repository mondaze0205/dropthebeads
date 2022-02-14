const pixelCanvas = document.querySelector('.pixel-canvas');

$(".c_head_s").click(function(){
	$(".c_head_s").css("background-color", "transparent")
	$(".c_head_s").css("font-weight", "normal")
	$(this).css("background-color", "lightblue");
	$(this).css("font-weight", "bold");
	document.getElementById("head").value = this.id
});

$("#loadbtn").click(function(){
	window.open("paintLoadAtWrite", "그림 불러오기", "width=400, height=300, directories=no, fullscreen=no, status=no, menubar=no, resizable=no, scrollorbars=no, toolbar=no, location=no");
})


$("#submitbtn").click(function(){
	document.getElementById("title").value = document.getElementById("dummyid").value
	document.writeform.submit();
})


$("#cancelbtn").click(function(){
	history.back();
})

$("#h_copy").click(function(){
	
	while (pixelCanvas.firstChild) {
    	pixelCanvas.removeChild(pixelCanvas.firstChild);
    }
 
    var codes = document.querySelector('#h_code').value;
  	var ss = codes.split("\n");
  	
	var newHeight = ss.length - 1;
  	var newWidth = ss[0].split(" ").length - 1;

  	
  	// 행과 열을 만든다.
  	for (let i = 1; i <= newHeight; i++) {
    	let newgridRow = document.createElement('tr');
    	var code_row = ss[i-1].split(" ");
    	pixelCanvas.appendChild(newgridRow);
    	for (let j = 1; j <= newWidth; j++) {
			var color = code_row[j-1];
			if (color == "#t") {
				color = "transparent"
			}
      		let newgridCell = document.createElement('td');
      		newgridRow.appendChild(newgridCell);
      		newgridCell.style.backgroundColor = color;   		
     	}
  	}
	
	if(newHeight >= 72 || newWidth >= 72) {
		$(".canvas tr").css("height", "1px");
		$(".canvas td").css("min-width", "1px");
	} else if(newHeight >= 48 || newWidth >= 48) {
		$(".canvas tr").css("height", "4px");
		$(".canvas td").css("min-width", "4px");
	} else if(newHeight >= 24 || newWidth >= 24) {
		$(".canvas tr").css("height", "8px");
		$(".canvas td").css("min-width", "8px");
	} else {
		$(".canvas tr").css("height", "20px");
		$(".canvas td").css("min-width", "20px");
	}
	
	$("#loadbtn").css("display", "none")
	
});

$(".canvas").click(function(){
	$("#loadbtn").trigger('click');
})