<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���! ���!</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<hr color="#00af79" size="2px">
<style>
  .start {
  		width: 200px;
        margin: 0px auto;
        position: relative;
  }
  .startbtnon {
		position: absolute;
		top: 0px;
		left: 0px;
		display: none;
  }
  .start:hover .startbtnon {
  		display: block;
  }
  
  .game { 
  		margin-left: auto; 
 		margin-right: auto; 
  		background: url('/image/grass.jpg') center center no-repeat; width: 1100px; height: 700px;
  		background-size: 1100px 700px;
  		cursor:  url('/image/cursor.png') 40 40, auto;
  }
  		/* Ŀ���̹��� ������ 80*80�� = �߾���ġ�� 40*40 */
  .gamehead{
    	width: 1100px; height: 200px;
  }
  
  @keyframes jump {
		0% {
		  top:0px;
		  width: 150px;
		  height:150px
		}
		55% {
		  top:100px;
		}
		95% {
		  width: 150px;
		  height:150px
		}
		to {
		  top:100px;
		  width:150px;
		  height:150px
		} 
  }
  img.jump{
   		position:relative;
		left: 800px;
		top:0;
		animation:jump 1s ease-in Infinite Alternate;
    	width:250px; height: 250px;
  }
  .left{
  		float: left;
  		width: 50%;
  }
  .right{
  		background: url('/image/signboard.png');
  		float: right;
  		width: 370px; height:490px;
 		margin-right: 90px; 
  }
  .texta{
  		font-family: 'Gowun Dodum', sans-serif ;
  		margin-top: 40px;
  		margin-left: 50px;
  		margin-right: 30px;
  }
  .timer{
  		font-size: 20px;
  }
  .cell {
  		margin-left: 15px;
		display: inline-block; position: relative; 
    	width: 160px; height: 160px;
    	background: 'yellow'; overflow: hidden;
  }
  .carrot, .bomb, .goldcarrot {
	    width: 150px; height: 150px; bottom: 0; position: absolute; transition: bottom 1s;
	    cursor: url('/image/cursor2.png') 40 40, auto;; 
  }
  .carrot {
	    background: url('/image/carrot.png') center center no-repeat;
	    background-size: 130px 130px;
  }
  .goldcarrot {
	    background: url('/image/goldcarrot.png') center center no-repeat;
	    background-size: 130px 130px;
  }
  .point {
	    background: url('/image/1.png') center center no-repeat;
	    background-size: 130px 130px;
	    pointer-events: none;
  }
  .goldpoint{
	    background: url('/image/5.png') center center no-repeat;
	    background-size: 130px 130px;
	    pointer-events: none;
  }
  .bomb {
	    background: url('/image/bomb.png') center center no-repeat;
	    background-size: 130px 130px;
  }
  .boom {
	    background: url('/image/explode.png') center center no-repeat;
	    background-size: 130px 130px;
	    pointer-events: none;
  }
  .hidden {
 		bottom: -200px;
  }
  .hole1 {
	    width: 160px; height: 110px; position: absolute; bottom: 0;
	    background: url('/image/hole1.png') center center no-repeat;
	    background-size: 160px 110px;
  }
  .hole2 {
	    width: 160px; height: 110px; position: absolute; bottom: 0;
	    background: url('/image/hole2.png') center center no-repeat;
	    background-size: 160px 110px;
  }
  .hole3 {
	    width: 160px; height: 110px; position: absolute; bottom: 0;
	    background: url('/image/hole3.png') center center no-repeat;
	    background-size: 160px 110px;
  }/* 
  .hole-front {
	    width: 200px; height: 30px; position: absolute; bottom: 0;
	    background: url('/image/mole-hole-front.png') center center no-repeat;
	    background-size: 200px 30px;
  } */
</style>
</head>
<body>
	<input type="hidden" id="useridid" value="${user.userid}">
	<input type="hidden" id="oldscore" value="${aaa.gscore}">
	
	<div class="start">
		<img class="startbtn" src="/image/startbtn.png" width="224" height="81"/>
		<img class="startbtnon" id="start" src="/image/startbtnon.png" width="224" height="81" onclick/>
	</div>
	
	<div id="game" class="game">
		<div class="row">
    		<div class="gamehead">
				<img class="jump" src="/image/jump.png"/>
			</div>
		</div>
		
		<div class="left">
			<div class="row">
	    		<div class="cell">
	      			<div class="hole1"></div>
	      			<div class="carrot hidden"></div>
	      			<div class="goldcarrot hidden"></div>
	      			<div class="bomb hidden"></div>
	      			<div class="hole-front"></div>
	    		</div>
	    		<div class="cell">
	      			<div class="hole2"></div>
	      			<div class="carrot hidden"></div>
	      			<div class="goldcarrot hidden"></div>
	      			<div class="bomb hidden"></div>
	      			<div class="hole-front"></div>
	    		</div>
	    		<div class="cell">
	      			<div class="hole3"></div>
	      			<div class="carrot hidden"></div>
	      			<div class="goldcarrot hidden"></div>
	      			<div class="bomb hidden"></div>
	      			<div class="hole-front"></div>
	    		</div>
	  		</div>
			<div class="row">
		    	<div class="cell">
		      		<div class="hole2"></div>
		      		<div class="carrot hidden"></div>
		      		<div class="goldcarrot hidden"></div>
		      		<div class="bomb hidden"></div>
		      		<div class="hole-front"></div>
		    	</div>
		    	<div class="cell">
		      		<div class="hole3"></div>
		      		<div class="carrot hidden"></div>
		      		<div class="goldcarrot hidden"></div>
		      		<div class="bomb hidden"></div>
		      		<div class="hole-front"></div>
		    	</div>
		    	<div class="cell">
		      		<div class="hole1"></div>
		      		<div class="carrot hidden"></div>
		      		<div class="goldcarrot hidden"></div>
		      		<div class="bomb hidden"></div>
		      		<div class="hole-front"></div>
		    	</div>
		  	</div>
	  		<div class="row">
	    		<div class="cell">
	      			<div class="hole3"></div>
	      			<div class="carrot hidden"></div>
	      			<div class="goldcarrot hidden"></div>
	      			<div class="bomb hidden"></div>
	      			<div class="hole-front"></div>
	    		</div>
	    		<div class="cell">
	      			<div class="hole1"></div>
	      			<div class="carrot hidden"></div>
	      			<div class="goldcarrot hidden"></div>
	      			<div class="bomb hidden"></div>
	      			<div class="hole-front"></div>
	    		</div>
	    		<div class="cell">
	      			<div class="hole2"></div>
	      			<div class="carrot hidden"></div>
	      			<div class="goldcarrot hidden"></div>
	      			<div class="bomb hidden"></div>
	      			<div class="hole-front"></div>
	    		</div>
	  		</div>
	  	</div>
	  	<div class="right">
		  	<div class="texta">				
		  		<c:if test="${user.userid != null}">
					<span style="font-size: 35px; font-weight: bold;">${aaa.nickname}</span>
					<span style="font-size: 20px; font-weight: bold;">&nbsp; score: ${aaa.gscore}��</span><br>
					<span style="font-size: 35px; font-weight: bold;">-----------------</span>
				</c:if>
				<c:if test="${user.userid == null}">
					<span style="font-size: 35px; font-weight: bold;">�α����ϼ���!</span><br>
					<h5>����� ������� �α����� �ؾ��մϴ�.</h5>
				</c:if>
				<h1>
					<span id="score">0</span>��
					<span id="life" style="font-size: 30px;">3</span>���
					<span id="timer" float="left" style="color: red">30</span>��&nbsp;<br>
				</h1>
				<div>
					<h1>------RANK------</h1>
					<c:forEach items="${bbb}" var="b" begin="0" end="2" step="1" varStatus="v">
						<c:if test="${b.gscore != 0}">
							<h2>${v.index+1}�� &nbsp; ${b.nickname} &nbsp; ${b.gscore}��</h2>
						</c:if>
					</c:forEach>
				</div>
			</div>
	  	</div>
	</div>
		
	
	
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- $ is not defined�� jquery�����̶� �߰�������� -->
<script>
	const $timer = document.querySelector('#timer');
	const $score = document.querySelector('#score');
	const $game = document.querySelector('#game');
	const $life = document.querySelector('#life');
	const $start = document.querySelector('#start');
	const $$cells = document.querySelectorAll('.cell'); // 9ĭ�� ���� ������ ��
	var startS = new Audio('/sound/ss.m4a');
	var boomS = new Audio('/sound/boom.m4a');
	var eatS = new Audio('/sound/eat.m4a');
	var goldS = new Audio('/sound/goldS.m4a');
	var endS = new Audio('/sound/endS.m4a');
	
	const holes = [0, 0, 0, 0, 0, 0, 0, 0, 0];
	let started = false;
	let score = 0;
	let time = 30;
	let life = 3;
	let timerId;
	let tickId;
	let count = 0;
	
	$start.addEventListener('click', () => {
		startS.play();
		if (started) return; // �̹� ���������� ����
	    started = true;
	    console.log('����');
	    timerId = setInterval(() => {
	    	time = (time * 10 - 1) / 10; // �Ҽ��� ��� �� �����־ ������ �ٲ� �� 10�� ���� �Ҽ������� �ٲ���
	      	$timer.textContent = time;
	      	if (time === 0) { // �ð��� 0�� �Ǹ� ���ӿ���. ȭ�� �׸��� ���� ���⶧���� setTimeout���� �ð��� ����Ѵ�. 
	        	clearInterval(timerId);
	        	clearInterval(tickId);
	        	setTimeout(() => {
	        		endS.play();
		            alert('���� ����! ������'+ score +'��');
		            var userid = document.getElementById("useridid").value
		            var oldscore = document.getElementById("oldscore").value
		            $.ajax({url: "/game/upscore", 
			            //data�� ���� ������ �ʾƵ� �ȴٰ� ���� ���ߴµ� data�ٿ��� ������.. ����..
			            data:"gscore="+score+"&userid="+userid+"&oldscore="+oldscore,
			            method:"post"
			            }).done(function(){
			               location.reload();
			            });
		               location.reload();
		        }, 50);
        		//alert(score);
	      	}
	    }, 100);
	    tickId = setInterval(tick, 1000); // 1�ʸ���
	    tick();
	});
	
	// ȭ��: hidden
	// ȣ�⽺��:
	// ��׶��� : interval(tick, 1000), setTimeout(add, 1000)
	// �½�ũť: tick, add //�ʰ� ������ ���� ȣ��Ȱ��� �½�ũť�� ���� ����.
	let carrotPercent = 0.3; // �δ��� ���� 30%
	let bombPercent = 0.5; // ��ź ���� 20% // ����Ȯ�� - if, else if�� �Բ� ���
					// 0.2�� ���� �ʴ� ���� = 0.3���� ������ �δ���. 0.3~0.5���� ������ ��ź �ش���� ������ �ƹ��͵� ���� �ʰ�
	let goldcarrotPercent = 0.6; // Ȳ�ݵδ��� ���� 10%
	
	function tick() {
		holes.forEach((hole, index) => {
			if (hole) return; // hole�� ���� ������(�ö��������) return
	      	const randomValue = Math.random(); // ������ ���ڸ� �̾ƿ´�.
	      	if (randomValue < carrotPercent) {
	        	const $carrot = $$cells[index].querySelector('.carrot');
	        	holes[index] = setTimeout(() => { // 1�� �ڿ� ����� // �񵿱� //Ÿ�̸� ��Ҹ� ���� Ÿ�̸� ���̵� holes�� �������ش�.
	        		// setTimeout�� id�� ����(���ð�). �������踦 �����ϱ����� holes[index] ���
	          		$carrot.classList.add('hidden');
	          		holes[index] = 0;
	        	}, 1000); 
	        	$carrot.classList.remove('hidden');
	      	} else if (randomValue < bombPercent) {
	        	const $bomb = $$cells[index].querySelector('.bomb');
	        	holes[index] = setTimeout(() => { // 1�� �ڿ� �����
	          		$bomb.classList.add('hidden');
	          		holes[index] = 0;
	        	}, 1000); 
	        	$bomb.classList.remove('hidden');
	      	} else if (randomValue < goldcarrotPercent){
	    	  	const $carrot = $$cells[index].querySelector('.goldcarrot');
	          	holes[index] = setTimeout(() => { // 1�� �ڿ� �����
		            $carrot.classList.add('hidden');
		            holes[index] = 0;
	          	}, 1000); 
	          	$carrot.classList.remove('hidden');
	      	}
	    });
	}
	
	$$cells.forEach(($cell, index) => { // 9ĭ�� �ݺ��� ���鼭 
		$cell.querySelector('.carrot').addEventListener('click', (event) => {// �� ������ �δ����� ã�Ƽ� click
	    	if (!event.target.classList.contains('point')) { // �����ʰ������� 
	    		eatS.play();
	        	score += 1;
	        	$score.textContent = score;
	      	}
	      	event.target.classList.add('point'); // ��� ǥ������ �ٲ��
	      	event.target.classList.add('hidden'); // ��������
	      	clearTimeout(holes[index]); // ������ �������� Ÿ�̸�(1�ʵ�) �����ϰ� click ��� ���������� ��
	      	setTimeout(() => {
		        holes[index] = 0;
	        	event.target.classList.remove('point'); // ��� �δ����� ������� ���� �ö󰡴� �δ����� �����ʰ�������������
	      	}, 1000);
	    });
	    
	    
	    $cell.querySelector('.bomb').addEventListener('click', (event) => {
	    	if (!event.target.classList.contains('boom')) {
				  boomS.play();
	    	      life--;
	    	      $life.textContent = life;
	          }
	      	event.target.classList.add('boom');
	      	event.target.classList.add('hidden');
	      	clearTimeout(holes[index]); // ���� �������� Ÿ�̸� ����
	      	setTimeout(() => {
		        holes[index] = 0;
		        event.target.classList.remove('boom');
	    	}, 1000);
	      	if (life === 0) {
		        clearInterval(timerId);
		        clearInterval(tickId);
	        	setTimeout(() => {
	        		endS.play();
		            alert('���� ����! ������'+ score +'��');
		            var userid = document.getElementById("useridid").value
		            var oldscore = document.getElementById("oldscore").value
		            $.ajax({url: "/game/upscore", 
			            //data�� ���� ������ �ʾƵ� �ȴٰ� ���� ���ߴµ� data�ٿ��� ������.. ����..
			            data:"gscore="+score+"&userid="+userid+"&oldscore="+oldscore,
			            method:"post"
			            }).done(function(){
			               location.reload();
			            });
		               location.reload();
	        	}, 200);
	      	}
	    });
	    
	
	    $cell.querySelector('.goldcarrot').addEventListener('click', (event) => {
	    	count += 1;
	    	console.log(count);
	    	if (count == 3){
	    		if (!event.target.classList.contains('goldpoint')) {
	    			  goldS.play();
	    	          score += 5;
	    	          $score.textContent = score;
	    	          count = 0;
	            }
	   	        event.target.classList.add('goldpoint');
	   	        event.target.classList.add('hidden');
	   	        clearTimeout(holes[index]); // ���� �������� Ÿ�̸� ����
	   	        setTimeout(() => {
	   	          holes[index] = 0;
	   	          event.target.classList.remove('goldpoint');
	   	        }, 1000);
	    	}
	    });
	
	  });
</script>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>