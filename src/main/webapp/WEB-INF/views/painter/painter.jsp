<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Pixel Art Maker</title>
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/css/painter.css">
</head>
<body>
	<header>
		<div class="h1">
			<div class="g1">
				<a href="#">로그인</a>
			</div>
			<div class="g1">
				<a href="#">마이페이지</a>
			</div>
			<div class="g1">
				<a href="#">관리자 메뉴</a>
			</div>
		</div>
		<div class="h2">
			<div class="g2">
				<a href="#">픽셀아트</a>
			</div>
			<div class="g2">
				<a href="#">커뮤니티</a>
			</div>
			<div class="g2">
				<a href="#">구매페이지</a>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="size_side">
			<form class="size_picker">
			<div class="size_pick">
				<ul class="size_ul">
					<li class="size_li_center">크기 설정</li>
				</ul>
				<ul class="size_ul2">
					<li class="size_li_center">가로</li>
					<li class="size_li">
						<select class="input-width" name="width">
							<option value="6">6</option>
							<option value="24" selected="selected">24</option>
							<option value="48">48</option>
							<option value="72">72</option>
							<option value="96">96</option>
						</select>
					</li>
				</ul>
				<ul class="size_ul2">
					<li class="size_li_center">세로</li>
					<li class="size_li">
						<select class="input-height" name="height">
							<option value="6">6</option>
							<option value="24" selected="selected">24</option>
							<option value="48">48</option>
							<option value="72">72</option>
							<option value="96">96</option>
						</select>
					</li>
				</ul>
				<ul class="hidden">
					<li>
						<button type="submit" id="submit" class="submit-button">만들기</button>	
					</li>
				</ul>
			</div>
			</form>
		</div>
		<div class="pal_l">
			<div class="pal_l_1">
				<p>직접 선택 : </p>
				<input type="color" class="color_picker">
			</div>
			<div class="pal_l_2">
				<p>현재 색깔 : </p>
				<table>
					<tr>
						<td id="prePal"></td>
					</tr>
				</table>
			</div>
			<div class="pal_1_3">
				<p id="color_info">선택하세요<br>　</p>
			</div>
		</div>
		<div class="pal_r">
			<table class="palette">
				<tr>
					<td id="없음" style="background-color: rgba(0, 0, 0, 0)"></td>
					<td id="화이트" style="background-color: #ffffff"></td>
					<td id="스노우" style="background-color: #fffafa"></td>
					<td id="허니듀" style="background-color: #f0fff0"></td>
					<td id="민트크림" style="background-color: #f5fffa"></td>	
					<td id="아주르" style="background-color: #f0ffff"></td>	
					<td id="앨리스블루" style="background-color: #f0f8ff"></td>
					<td id="고스트화이트" style="background-color: #f8f8ff"></td>
					<td id="화이트스모크" style="background-color: #f5f5f5"></td>
					<td id="씨쉘" style="background-color: #fff5ee"></td>
					<td id="베이지" style="background-color: #f5f5dc"></td>
					<td id="올드레이스" style="background-color: #fdf5e6"></td>
					<td id="플로랄화이트" style="background-color: #fffaf0"></td>
					<td id="아이보리" style="background-color: #fffff0"></td>
					<td id="앤티크화이트" style="background-color: #faebd7"></td>
					<td id="리넨" style="background-color: #faf0e6"></td>
					<td id="라벤더블러쉬" style="background-color: #fff0f5"></td>
					<td id="미스티로즈" style="background-color: #ffe4e1"></td>
					<td id="게인스보로" style="background-color: #dcdcdc"></td>
					<td id="라이트그레이" style="background-color: #d3d3d3"></td>
					<td id="실버" style="background-color: #c0c0c0"></td>
					<td id="다크그레이" style="background-color: #a9a9a9"></td>
					<td id="그레이" style="background-color: #bebebe"></td>
					<td id="딤그레이" style="background-color: #696969"></td>
					<td id="라이트슬레이트그레이" style="background-color: #778899"></td>
					<td id="슬레이트그레이" style="background-color: #708090"></td>	
					<td id="다크슬레이트그레이" style="background-color: #2f4f4f"></td>
					<td id="블랙" style="background-color: #000000"></td>
				</tr>
				<tr>
					<td id="콘실크" style="background-color: #fff8dc"></td>
					<td id="블렌치드아몬드" style="background-color: #ffebcd"></td>
					<td id="비스크" style="background-color: #ffe4c4"></td>
					<td id="나바조화이트" style="background-color: #ffdead"></td>
					<td id="휘트" style="background-color: #f5deb3"></td>
					<td id="버리우드" style="background-color: #deb887"></td>
					<td id="탠" style="background-color: #d2b48c"></td>
					<td id="로즈브라운" style="background-color: #bc8f8f"></td>
					<td id="샌디브라운" style="background-color: #f4a460"></td>
					<td id="골든로드" style="background-color: #daa520"></td>
					<td id="다크골든로드" style="background-color: #b8890b"></td>
					<td id="페루" style="background-color: #cd853f"></td>
					<td id="초콜렛" style="background-color: #d2691e"></td>
					<td id="새들브라운" style="background-color: #8b4513"></td>
					<td id="시에나" style="background-color: #a0522d"></td>
					<td id="브라운" style="background-color: #a52a2a"></td>
					<td id="마룬" style="background-color: #b03060"></td>
					<td id="옐로우" style="background-color: #ffff00"></td>
					<td id="라이트옐로우" style="background-color: #ffffe0"></td>
					<td id="레몬쉬폰" style="background-color: #fffacd"></td>
					<td id="라이트골든로드옐로우" style="background-color: #fafad2"></td>
					<td id="파파야휘프" style="background-color: #ffefd5"></td>
					<td id="모카신" style="background-color: #ffe4b5"></td>
					<td id="피치퍼프" style="background-color: #ffdab9"></td>
					<td id="페일골든로드" style="background-color: #eee8aa"></td>	
					<td id="카키" style="background-color: #fff68f"></td>
					<td id="다크카키" style="background-color: #bdb76b"></td>
					<td id="골드" style="background-color: #ffd700"></td>
				</tr>
				<tr>
					<td id="핑크" style="background-color: #ffc0cb"></td>
					<td id="라이트핑크" style="background-color: #ffb6c1"></td>
					<td id="핫핑크" style="background-color: #ff69b4"></td>
					<td id="딥핑크" style="background-color: #ff1493"></td>
					<td id="페일바이올렛레드" style="background-color: #db7093"></td>
					<td id="미디엄바이올렛레드" style="background-color: #c71585"></td>
					<td id="라이트새먼" style="background-color: #ffa07a"></td>
					<td id="새먼" style="background-color: #fa8072"></td>
					<td id="다크새먼" style="background-color: #e9967a"></td>
					<td id="라이트코랄" style="background-color: #f08080"></td>
					<td id="인디안레드" style="background-color: #cd5c5c"></td>
					<td id="크림슨" style="background-color: #dc143c"></td>
					<td id="파이어브릭" style="background-color: #b22222"></td>
					<td id="다크레드" style="background-color: #8b0000"></td>
					<td id="레드" style="background-color: #ff0000"></td>
					<td id="오렌지레드" style="background-color: #ff4500"></td>
					<td id="토마토" style="background-color: #ff6347"></td>
					<td id="코랄" style="background-color: #ff7f50"></td>
					<td id="다크오렌지" style="background-color: #ff8c00"></td>
					<td id="오렌지" style="background-color: #ffa500"></td>
					<td id="다크올리브그린" style="background-color: #556b2f"></td>
					<td id="올리브" style="background-color: #808000"></td>
					<td id="올리브드랍" style="background-color: #6b8e23"></td>
					<td id="옐로우그린" style="background-color: #9acd32"></td>
					<td id="라임그린" style="background-color: #32cd32"></td>
					<td id="라임" style="background-color: #00ff00"></td>
					<td id="론그린" style="background-color: #7cfc00"></td>
					<td id="샤르트뢰즈" style="background-color: #7fff00"></td>
				</tr>
				<tr>	
					<td id="그린옐로우" style="background-color: #adff2f"></td>
					<td id="스프링그린" style="background-color: #00ff7f"></td>
					<td id="미디엄스프링그린" style="background-color: #00fa9a"></td>
					<td id="라이트그린" style="background-color: #90ee90"></td>
					<td id="페일그린" style="background-color: #98fb98"></td>
					<td id="다크씨그린" style="background-color: #8fbc8f"></td>
					<td id="미디엄씨그린" style="background-color: #3cb371"></td>
					<td id="씨그린" style="background-color: #2e8b57"></td>
					<td id="포레스트그린" style="background-color: #228b22"></td>
					<td id="그린" style="background-color: #008000"></td>
					<td id="다크그린" style="background-color: #006400"></td>
					<td id="라벤더" style="background-color: #e6e6fa"></td>
					<td id="씨슬" style="background-color: #d8bfd8"></td>
					<td id="플럼" style="background-color: #dda0dd"></td>
					<td id="바이올렛" style="background-color: #ee82ee"></td>
					<td id="오키드" style="background-color: #da70d6"></td>
					<td id="마젠타" style="background-color: #ff00ff"></td>
					<td id="미디엄오키드" style="background-color: #ba55d3"></td>
					<td id="미디엄퍼플" style="background-color: #9370db"></td>
					<td id="블루바이올렛" style="background-color: #8a2be2"></td>
					<td id="다크바이올렛" style="background-color: #9400d3"></td>
					<td id="다크오키드" style="background-color: #9932cc"></td>
					<td id="다크마젠타" style="background-color: #8b008b"></td>
					<td id="퍼플" style="background-color: #800080"></td>
					<td id="인디고" style="background-color: #4b0082"></td>
					<td id="다크슬레이트블루" style="background-color: #483d88"></td>
					<td id="슬레이트블루" style="background-color: #6a5acd"></td>
					<td id="미디엄슬레이트블루" style="background-color: #7b68ee"></td>		
				</tr>
				<tr>
					<td id="라이트슬레이트블루" style="background-color: #8470ff"></td>
					<td id="미디엄아쿠아마린" style="background-color: #66cdaa"></td>
					<td id="시안" style="background-color: #00ffff"></td>
					<td id="라이트시안" style="background-color: #e0ffff"></td>
					<td id="페일터쿼이즈" style="background-color: #afeeee"></td>
					<td id="아쿠아마린" style="background-color: #7fffd4"></td>
					<td id="터쿼이즈" style="background-color: #40e0d0"></td>
					<td id="미디엄터쿼이즈" style="background-color: #48d1cc"></td>
					<td id="다크터쿼이즈" style="background-color: #00ced1"></td>
					<td id="라이트씨그린" style="background-color: #20b2aa"></td>
					<td id="커딧블루" style="background-color: #5f9ea0"></td>
					<td id="다크시안" style="background-color: #008b8b"></td>
					<td id="틸" style="background-color: #008080"></td>
					<td id="라이트스틸블루" style="background-color: #b0c4de"></td>
					<td id="파우더블루" style="background-color: #b0e0e6"></td>
					<td id="라이트블루" style="background-color: #add8e6"></td>
					<td id="스카이블루" style="background-color: #87ceeb"></td>
					<td id="라이트스카이블루" style="background-color: #87cefa"></td>
					<td id="딥스카이블루" style="background-color: #00bfff"></td>
					<td id="닷저블루" style="background-color: #1e90ff"></td>
					<td id="콘플라워블루" style="background-color: #6495ed"></td>
					<td id="스틸블루" style="background-color: #4682b4"></td>
					<td id="로얄블루" style="background-color: #4169e1"></td>
					<td id="블루" style="background-color: #0000ff"></td>
					<td id="미디엄블루" style="background-color: #0000cd"></td>	
					<td id="다크블루" style="background-color: #00008b"></td>
					<td id="네이비블루" style="background-color: #000080"></td>	
					<td id="미드나이트블루" style="background-color: #191970"></td>
				</tr>
			</table>
		</div>
		<div class="pal_btn">
			<button type="button" id="dummy" class="btn0">만들기</button>
			<button type="button" id="fill" class="btn1">채우기</button>
			<button type="button" id="draw" class="btn1">그리기</button>
			<button type="button" id="erase" class="btn1">지우기</button>
			<p>
			더블클릭하셔도 지워집니다.
			</p>
			<button type="button" id="readme" class="btn2">참고사항</button>
			<button type="button" id="dummy2" class="btn2">저장</button>
			<button type="button" id="load" class="btn2">불러오기</button>
		</div>
		<div class="canvas">
			<table class="pixel-canvas"></table>
			<br>
		</div>
	</div>
	<div class="slzone">
	<form method='post' action='paintSave' name="paintSave">
		<textarea id="code" name="code" readonly></textarea>
		<input type="text" id="pic_id" name="pic_id" value="새 그림" readonly>
		<input type="text" id="pic_name" name="pic_name" value="새 그림" readonly>
		<button type="button" id="save" name="save" value="save">저장</button>
	</form>
	<button type="button" id="copypic">복사</button>
	</div>
	<input type="button" id="btn001" value="click">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="/js/painter.js"></script>
</body>
</html>
