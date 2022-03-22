const rabbit = document.getElementById("rabbit");
const carrot = document.getElementById("carrot");
const score = document.getElementById("score");
const button = document.querySelector("button");


function jump(){
	rabbit.classList.add('jump-animation');
	setTimeout(() => {
		rabbit.classList.remove('jump-animation');
	},400); //점프 시간 
}

button.addEventListener("click", 
function start() {
	carrot.classList.add('move-animation');
	score.innerText++; //스코어 추가 
})

document.addEventListener('keypress', ()=> {
	if(!rabbit.classList.contains('jump-animation')){
		jump();
	}
})

setInterval(() =>{
	//score.innerText++; //스코어 추가 
	const rabbitTop = parseInt(window.getComputedStyle(rabbit)
		.getPropertyValue('top'));
	const carrotLeft = parseInt(window.getComputedStyle(carrot)
		.getPropertyValue('left'));	
		
	if (carrotLeft < 0 ){
		carrot.style.display = 'none';
	} else{
		carrot.style.display ='';
	}	
	// 토끼가 당근이랑 충돌되면 
	if (carrotLeft < 50 && carrotLeft > 0 && rabbitTop > 150){
		carrot.style.animation="none";
		alert("GAME OVER!\n점수는? : " + score.innerText + "\n다시 도전?");
		location.reload();
	}
},50);


