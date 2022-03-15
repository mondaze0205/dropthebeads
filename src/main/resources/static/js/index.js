$(function() {
	for (let a = 1; a <= 3; a++) {
		let pictureid = document.getElementById('pictureid' + a).value;
		let pixelCanvas = document.getElementById('pixel-canvas' + a);
		let flea = document.getElementById('boardf' + a).value;
		let fpic = "/upload/" + document.getElementById('fpic' + a).value;
		let fpicadd = document.getElementById('fpicadd' + a);

		if (flea != "") {
			$(".boardf" + a).css("display", "block");
			var img = document.createElement("img");

			img.setAttribute("src", fpic);
			img.setAttribute("onerror", "this.src='/image/noimage.png'");
			img.setAttribute("width", "300px");
			img.setAttribute("height", "auto");

			fpicadd.appendChild(img);
		}

		if (pictureid != "") {
			$(".boardc" + a).css("display", "block");

			$.getJSON("/painter/paintLoad2", { "pictureid": pictureid }, function(data) {
				var code = data.code;
				var picname = data.picname;
				document.getElementById("code" + a).value = code;

				var codes = document.getElementById('code' + a).value;
				var ss = codes.split("\n");

				var newHeight = ss.length - 1;
				var newWidth = ss[0].split(" ").length - 1;

				for (let i = 1; i <= newHeight; i++) {
					let newgridRow = document.createElement('tr');
					var code_row = ss[i - 1].split(" ");
					pixelCanvas.appendChild(newgridRow);
					for (let j = 1; j <= newWidth; j++) {
						var color = code_row[j - 1];
						if (color == "#t") {
							color = "transparent"
						}
						let newgridCell = document.createElement('td');
						newgridRow.appendChild(newgridCell);
						newgridCell.style.backgroundColor = color;
					}
				}

			}); //getJSON
		}//if
	}//for

});