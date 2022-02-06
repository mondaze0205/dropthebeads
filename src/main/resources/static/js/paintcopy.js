const pixelCanvas = document.querySelector('.pixel-canvas');

$(function(){ 
  	
  	let gridHeight = document.querySelector('#row').value;
  	let gridWidth = document.querySelector('#column').value;
  	let codes = document.querySelector('.code').value;
  	var ss = codes.split("\n");
  	/* 격자가 이미 존재하면, 모든 차있는 셀을 청소한다.
  	while (pixelCanvas.firstChild) {
    	pixelCanvas.removeChild(pixelCanvas.firstChild);
    }
    */	
  	// 행과 열을 만든다.
  	for (let i = 1; i <= gridHeight; i++) {
    	let gridRow = document.createElement('tr');
    	var code_row = ss[i-1].split(" ");
    	pixelCanvas.appendChild(gridRow);
    	for (let j = 1; j <= gridWidth; j++) {
			var color = code_row[j-1];
			if (color == "#t") {
				color = "transparent"
			}
      		let gridCell = document.createElement('td');
      		gridRow.appendChild(gridCell);
      		gridCell.style.backgroundColor = color;   		
     	}
  	}
});