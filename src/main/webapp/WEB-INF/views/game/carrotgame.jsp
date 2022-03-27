<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근! 당근!</title>
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
        on
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
  		/* 커서이미지 사이즈 80*80임 = 중앙위치인 40*40 */
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
	    background: url('/image/3.png') center center no-repeat;
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
					<span style="font-size: 20px; font-weight: bold;">&nbsp; score: ${aaa.gscore}점</span><br>
					<span style="font-size: 35px; font-weight: bold;">-----------------</span>
				</c:if>
				<c:if test="${user.userid == null}">
					<span style="font-size: 35px; font-weight: bold;">로그인하세요!</span><br>
					<h5>기록을 남기려면 로그인을 해야합니다.</h5>
				</c:if>
				<h1>
					<span id="score">0</span>점
					<span id="life" style="font-size: 30px;">3</span>목숨
					<span id="timer" float="left" style="color: red">30</span>초&nbsp;<br>
				</h1>
				<div>
					<h1>------RANK------</h1>
					<c:forEach items="${bbb}" var="b" begin="0" end="2" step="1" varStatus="v">
						<c:if test="${b.gscore != 0}">
							<h2>${v.index+1}위 &nbsp; ${b.nickname} &nbsp; ${b.gscore}점</h2>
						</c:if>
					</c:forEach>
				</div>
			</div>
	  	</div>
	</div>
		
	
	
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- $ is not defined는 jquery문법이라서 추가해줘야함 -->
<script>
	const $timer = document.querySelector('#timer');
	const $score = document.querySelector('#score');
	const $game = document.querySelector('#game');
	const $life = document.querySelector('#life');
	const $start = document.querySelector('#start');
	const $$cells = document.querySelectorAll('.cell'); // 9칸을 전부 선택한 것
	
	const holes = [0, 0, 0, 0, 0, 0, 0, 0, 0];
	let started = false;
	let score = 0;
	let time = 30;
	let life = 3;
	let timerId;
	let tickId;
	let count = 0;
	  
	$start.addEventListener('click', () => {
		if (started) return; // 이미 시작했으면 무시
	    started = true;
	    console.log('시작');
	    timerId = setInterval(() => {
	    	time = (time * 10 - 1) / 10; // 소수점 계산 시 문제있어서 정수로 바꾼 뒤 10을 나눠 소수점으로 바꿔줌
	      	$timer.textContent = time;
	      	if (time === 0) { // 시간이 0이 되면 게임오버. 화면 그리는 것을 막기때문에 setTimeout으로 시간을 줘야한다. 
	        	clearInterval(timerId);
	        	clearInterval(tickId);
	        	setTimeout(() => {
		            alert('게임 오버! 점수는'+ score +'점');
		            var userid = document.getElementById("useridid").value
		            var oldscore = document.getElementById("oldscore").value
		            $.ajax({url: "/game/upscore", 
			            //data를 따로 보내지 않아도 된다고 쌤이 말했는데 data붙여야 삭제됨.. 참고..
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
	    tickId = setInterval(tick, 1000); // 1초마다
	    tick();
	});
	
	// 화면: hidden
	// 호출스택:
	// 백그라운드 : interval(tick, 1000), setTimeout(add, 1000)
	// 태스크큐: tick, add //초가 같으면 먼저 호출된것이 태스크큐에 먼저 들어간다.
	let carrotPercent = 0.3; // 두더지 비율 30%
	let bombPercent = 0.5; // 폭탄 비율 20% // 누적확률 - if, else if와 함께 사용
					// 0.2로 하지 않는 이유 = 0.3보다 작으면 두더지. 0.3~0.5보다 작으면 폭탄 해당되지 않으면 아무것도 뜨지 않게
	let goldcarrotPercent = 0.6; // 황금두더지 비율 10%
	
	function tick() {
		holes.forEach((hole, index) => {
			if (hole) return; // hole에 값이 있으면(올라와있으면) return
	      	const randomValue = Math.random(); // 랜덤한 숫자를 뽑아온다.
	      	if (randomValue < carrotPercent) {
	        	const $carrot = $$cells[index].querySelector('.carrot');
	        	holes[index] = setTimeout(() => { // 1초 뒤에 사라짐 // 비동기 //타이머 취소를 위해 타이머 아이디를 holes에 저장해준다.
	        		// setTimeout의 id는 숫자(원시값). 참조관계를 유지하기위해 holes[index] 사용
	          		$carrot.classList.add('hidden');
	          		holes[index] = 0;
	        	}, 1000); 
	        	$carrot.classList.remove('hidden');
	      	} else if (randomValue < bombPercent) {
	        	const $bomb = $$cells[index].querySelector('.bomb');
	        	holes[index] = setTimeout(() => { // 1초 뒤에 사라짐
	          		$bomb.classList.add('hidden');
	          		holes[index] = 0;
	        	}, 1000); 
	        	$bomb.classList.remove('hidden');
	      	} else if (randomValue < goldcarrotPercent){
	    	  	const $carrot = $$cells[index].querySelector('.goldcarrot');
	          	holes[index] = setTimeout(() => { // 1초 뒤에 사라짐
		            $carrot.classList.add('hidden');
		            holes[index] = 0;
	          	}, 1000); 
	          	$carrot.classList.remove('hidden');
	      	}
	    });
	}
	
	$$cells.forEach(($cell, index) => { // 9칸을 반복문 돌면서 
		$cell.querySelector('.carrot').addEventListener('click', (event) => {// 각 셀에서 두더지를 찾아서 click
	    	if (!event.target.classList.contains('point')) { // 울지않고있으면 
	        	score += 1;
	        	$score.textContent = score;
	      	}
	      	event.target.classList.add('point'); // 우는 표정으로 바뀌고
	      	event.target.classList.add('hidden'); // 내려간다
	      	clearTimeout(holes[index]); // 기존의 내려가는 타이머(1초뒤) 제거하고 click 즉시 내려가도록 함
	      	setTimeout(() => {
		        holes[index] = 0;
	        	event.target.classList.remove('point'); // 우는 두더지를 지워줘야 다음 올라가는 두더지가 울지않고있음ㅋㅋㅋㅋ
	      	}, 1000);
	    });
	    
	    
	    $cell.querySelector('.bomb').addEventListener('click', (event) => {
	    	if (!event.target.classList.contains('boom')) {
	    	      life--;
	    	      $life.textContent = life;
	          }
	      	event.target.classList.add('boom');
	      	event.target.classList.add('hidden');
	      	clearTimeout(holes[index]); // 기존 내려가는 타이머 제거
	      	setTimeout(() => {
		        holes[index] = 0;
		        event.target.classList.remove('boom');
	    	}, 1000);
	      	if (life === 0) {
		        clearInterval(timerId);
		        clearInterval(tickId);
	        	setTimeout(() => {
		            alert('게임 오버! 점수는'+ score +'점');
		            var userid = document.getElementById("useridid").value
		            var oldscore = document.getElementById("oldscore").value
		            $.ajax({url: "/game/upscore", 
			            //data를 따로 보내지 않아도 된다고 쌤이 말했는데 data붙여야 삭제됨.. 참고..
			            data:"gscore="+score+"&userid="+userid+"&oldscore="+oldscore,
			            method:"post"
			            }).done(function(){
			               location.reload();
			            });
		               location.reload();
	        	}, 50);
	      	}
	    });
	    
	
	    $cell.querySelector('.goldcarrot').addEventListener('click', (event) => {
	
	    	count += 1;
	    	console.log(count);
	    	if (count == 3){
	    		if (!event.target.classList.contains('goldpoint')) {
	    	          score += 5;
	    	          $score.textContent = score;
	    	          count = 0;
	            }
	   	        event.target.classList.add('goldpoint');
	   	        event.target.classList.add('hidden');
	   	        clearTimeout(holes[index]); // 기존 내려가는 타이머 제거
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