const sizePicker = document.querySelector('.size_picker');
const pixelCanvas = document.querySelector('.pixel-canvas');
const quickFill = document.getElementById('fill');
const eraseMode = document.getElementById('erase');
const drawMode = document.getElementById('draw');

function makeGrid() {
  	
  	let gridHeight = document.querySelector('.input-height').value;
  	let gridWidth = document.querySelector('.input-width').value;
  	
  	// 격자가 이미 존재하면, 모든 차있는 셀을 청소한다.
  	while (pixelCanvas.firstChild) {
    	pixelCanvas.removeChild(pixelCanvas.firstChild);
    }
  	
  	// 행과 열을 만든다.
  	for (let i = 1; i <= gridHeight; i++) {
    	let gridRow = document.createElement('tr');
    	pixelCanvas.appendChild(gridRow);
    	for (let j = 1; j <= gridWidth; j++) {
      		let gridCell = document.createElement('td');
      		gridRow.appendChild(gridCell);
      		// 선택된 색으로 마우스를 누를때 셀을 채운다. 
      		gridCell.addEventListener('mousedown', function() {
       			const color = $("#prePal").css("background-color");
        		/// document.querySelector('.color-picker').value;
        		this.style.backgroundColor = color;
      		})
     	}
  	}
}

makeGrid(24, 24);

// 유저가 크기설정을 하고나면, 함수를 다시 실행한다. 
// 이때 e.preventdefault로 페이지가 새로 생성되지 않고 그리드만 다시 만들게 한다.
sizePicker.addEventListener('submit', function(e) {
 	e.preventDefault();
  	makeGrid();
});

// 드래그로 색깔 채우는걸 가능하게 하는 코드
// 마우스 버튼이 눌려져있는지 down 변수로 체크
let down = false;

pixelCanvas.addEventListener('mousedown', function(e) {
	
	down = true;
	
	pixelCanvas.addEventListener('mouseup', function() {
		down = false;
	});
	
	pixelCanvas.addEventListener('mouseleave', function() {
    	down = false;
  	});
  	
  	pixelCanvas.addEventListener('mouseover', function(e) {
    	const color = $("#prePal").css("background-color");
  		if (down) {
      		// 누르고 있는 위치의 태그이름이 'TD' 일경우 배경색을 바꿔줌.
      		if (e.target.tagName === 'TD') {
				//$(this).attr("bgcolor", color);
      			e.target.style.backgroundColor = color;
      		}
    	}
  	});
});


// 채우기 버튼
quickFill.addEventListener('click', function(e) {
	e.preventDefault();
  	const color = $("#prePal").css("background-color");
  	pixelCanvas.querySelectorAll('td').forEach(td => td.style.backgroundColor = color);
});

// 더블클릭으로 지우기 기능
pixelCanvas.addEventListener('dblclick', e => {
 	e.target.style.backgroundColor = null;
});

// 기본제공하고있지 않은 그리기와 지우기 모드
// 지우기 버튼 누른 이후에 드래그로 지우는 기능
eraseMode.addEventListener('click', function() {
  	
  	pixelCanvas.addEventListener('mousedown', function(e) {
  		
  		down = true;
  		
  		pixelCanvas.addEventListener('mouseup', function() {
  			down = false;
  		});
    	
    	pixelCanvas.addEventListener('mouseleave', function() {
    		down = false;
   		});
    	
    	pixelCanvas.addEventListener('mouseover', function(e) {
    		if (down) {
        	if (e.target.tagName === 'TD') {
        		e.target.style.backgroundColor = null;
        		}
      		}
    	});
  	});
  	
  	pixelCanvas.addEventListener('mousedown', function(e) {
    	e.target.style.backgroundColor = null;
  	});
});

// 다시 그리기 모드
drawMode.addEventListener('click', function() {
  	
  	pixelCanvas.addEventListener('mousedown', function(e) {
  		
  		down = true;
  		
  		pixelCanvas.addEventListener('mouseup', function() {
  			down = false;
  		});
    	
    	pixelCanvas.addEventListener('mouseleave', function() {
      		down = false;
    	});
    	
    	pixelCanvas.addEventListener('mouseover', function(e) {
      		const color = $("#prePal").css("background-color");
    		if (down) {
        		if (e.target.tagName === 'TD') {
        			e.target.style.backgroundColor = color;
        		}
      		}
    	});
  	});

  	pixelCanvas.addEventListener('mousedown', function(e) {
    	
    	if (e.target.tagName !== 'TD') return;
    	
    	const color = $("#prePal").css("background-color");
    	
    	e.target.style.backgroundColor = color;
  	});
});

$(".palette td").click(function(){
	$("#prePal").css("background-color", $(this).css("background-color"));
	$("#color_info").empty();
	$("#color_info").append($(this).attr("id"));
	$("#color_info").append("<br>");
	$("#color_info").append($(this).css("background-color"));
});

$(".color_picker").change(function(){
	$("#prePal").css("background-color", document.querySelector('.color_picker').value);
	var cvt = hexTorgb(document.querySelector('.color_picker').value);
	$("#color_info").empty();
	$("#color_info").append("커스텀 컬러");
	$("#color_info").append("<br>");
	$("#color_info").append(cvt);
});

function rgbTohex(str) {
	var ans = "#";
	if(str == "rgba(0, 0, 0, 0)") {
		ans = '#t'
	} else {
		var tempA = str.replace('rgb(','');
		tempA = tempA.replace(')','');
		var cs = tempA.split(", ");
		for(var i = 0; i < cs.length; i++) {
			var tempB = parseInt(cs[i], 10).toString(16);
			if(tempB.length != 2) {
				tempB = "0" + tempB;
			}
			ans = ans + tempB;
		}	
	}
	return ans;
}

function hexTorgb(str) {
	var ans = "rgb(";
	var temp = str.trim().replace('#', '');
	var red = temp.substr(0, 2);
	var green = temp.substr(2, 2);
	var blue = temp.substr(4, 2);
	red = parseInt(red, 16);
	ans = ans + red + ", ";
	green = parseInt(green, 16);
	ans = ans + green + ", ";
	blue = parseInt(blue, 16);
	ans = ans + blue + ")";
	return ans;
}

$("#readme").click(function(){
	alert('팔레트에서 기본 제공하는 색상의 이름은 x11색 체계에 따른 것입니다.\n시중에서 실제로 판매중인 제품의 색상과 일치하지 않을 수 있습니다.\n\n드래그를 이용하여 칠하실 때에는 적당한 속도를 유지해 주세요.\n이용하시면서 브라우저의 확대/축소 기능을 적절히 사용해 주세요.')
});



$("#load").click(function(){
	window.open("paintLoad", "그림 불러오기", "width=400, height=300, directories=no, fullscreen=no, status=no, menubar=no, resizable=no, scrollorbars=no, toolbar=no, location=no");
});

$("#dummy").click(function(){
	$("#submit").trigger('click');
});

$("#dummy2").click(function(){
	window.open("paintName", "그림 저장", "width=400, height=300, directories=no, fullscreen=no, status=no, menubar=no, resizable=no, scrollorbars=no, toolbar=no, location=no");
});

$("#save").click(function(){

	var form = document.paintSave;
	var rows = $(".pixel-canvas tr");
	var code = "";
	
	for(var i = 0; i < rows.length; i++) {
		var cells = rows[i].getElementsByTagName("td")
		
		for(var j = 0; j < cells.length; j++) {
			code = code + rgbTohex($(cells[j]).css("background-color"));
			//$(cells[j]).css("background-color");
			code = code + " ";
		}
		code = code + "\n"
	}
	
	document.getElementById("code").value = code;
	
	form.submit();
	
});

$("#copypic").click(function(){

	while (pixelCanvas.firstChild) {
    	pixelCanvas.removeChild(pixelCanvas.firstChild);
    }
    
    var codes = document.querySelector('#code').value;
  	var ss = codes.split("\n");
  	
	var newHeight = ss.length - 1;
  	var newWidth = ss[0].split(" ").length - 1;
  	
  	//alert(newHeight);
  	//alert(newWidth);
  
  	
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
	
});

$("#btn001").click(function(){
	alert('버튼 클릭')
	
	var rows = $(".pixel-canvas tr");
	var code = "";
	
	for(var i = 0; i < rows.length; i++) {
		var cells = rows[i].getElementsByTagName("td")
		
		for(var j = 0; j < cells.length; j++) {
			code = code + rgbTohex($(cells[j]).css("background-color"));
			//$(cells[j]).css("background-color");
			code = code + " ";
		}
		code = code + "\n"
	}
	
	
	alert(code);
});
