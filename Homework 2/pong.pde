float p1y, p2y;
float ballx, bally;
float ballVx, ballVy;
float timeElapsed;
boolean p1Won, p2Won = false;
float ballMult;
int[] score = {0, 0};
boolean paused = true;

//p1 controlled with up->w, down->s
//p2 controlled with up and down keys

void setup() {

	size(1536, 768);
	background(0, 0, 0);
	noStroke();
	fill(255, 255, 255);
	frameRate(60);

	p1y = height/2; p2y = height/2;
	ballx = width/4; bally = height/2;
	ballVx = 6.0; ballVy = 4.0;
	ballMult = 1.0;

	timeElapsed = 0.0;
}

void draw() {
  if (paused) {userInput();return;}

	if (p1Won || p2Won) {
		fill(0, 0, 0);
		textSize(100);
		if (p1Won) {
			background(0, 206, 255);
			text("Congrats! You Won Player1!", width/20, height/2);
		}
		else {
			background(255, 0, 200);
			text("Congrats! You Won Player2", width/20, height/2);
		}
		return;
	}

	background(0, 0, 0);
	fill(255, 255, 255);
	//border in middle
	for (int i = 0; i < 11; i++) {
		rect(width/2, i * (height/10) - 10, 15, height/15);
	}

	//p1
	fill(0, 206, 255);
	rect(35, p1y, 15, 200);

	//p2
	fill(255, 0, 200);
	rect(width - 45, p2y, 15, 200);

	//ball
	fill(255, 255, 255);

	ballx += (ballVx * ballMult); bally += (ballVy * ballMult);
	circle(ballx, bally, 40);

	drawScore();

	if (ballx >= width) {
		score[0]++;
		ballx = width/4;
		bally = height/2;
		background(0, 206, 255);
		ballMult = 1.0;
	}
	else if (ballx <= 0) {
		score[1]++;
		ballx = width*.75;
		bally = height/2;
		background(255, 0, 200);
		ballMult = 1.0;
	}
	if (score[0] == 3) {p1Won = true;}
	else if (score[1] == 3) {p2Won = true;}
	collisionDetection();

	if (bally >= height || bally <= 0) {
		ballVy *= -1.0;
	}

	userInput();
}


void userInput() {
	if (keyPressed) {
    if (paused) {if (key == 'p') {paused = false;}}
		if (key == 'w' && p1y >= 0) {p1y -= 15;}
		if (key == 's' && p1y <= height - 200) {p1y += 15;}
		if (keyCode == UP && p2y >= 0) { p2y -= 15;}
		if (keyCode == DOWN && p2y <= height - 200) { p2y += 15;}
	}
}

void collisionDetection() {
	if (bally >= p1y && bally <= p1y + 200) {
		if (ballx <= 50 + 20 && ballx >= 35) {
			ballVx *= -1.0;
			ballx += 10;
			ballMult += .3;
			background(0, 206, 255);
		}
	}

	if (bally >= p2y && bally <= p2y + 200) {
		if (ballx <= width-45 + 15 + 20 && ballx + 20 >= width-45) {
			ballVx *= -1.0;
			ballx -= 10;
			ballMult += .3;
			background(255, 0, 200);
		}
	}

}

void drawScore() {
	textSize(50);
	fill(255, 255, 255);
	text(score[0], width/4, height/8);
	text(score[1], width*.75, height/8);
}
