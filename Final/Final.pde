import processing.video.*;
import processing.sound.*;

//all music and sounds
SoundFile explosionSound;
SoundFile music;
SoundFile laserSound;
SoundFile lostMusic;
SoundFile wonMusic;

Entity[] entities = new Entity[2];
//in format w, a, s, d
boolean[] movingDirs = new boolean[4];
Bullet pBull;
ArrayList<EnemyBullet> enemyBulls;
int numStars = 42;
//star columns in two different orientations with +7 for buffer column
Star[] stars = new Star[(numStars*2) + 7];
int enemyStage = 1;
int framesForExplosion = 0;
int pausedWait = 30;
PImage explosionSprite;

//bools to keep track of which screen should be playing/outcome conditions
boolean titleScreen = true;
boolean playerWon = false;
boolean playerLost = false;
boolean isPaused = false;
boolean scoreUpdated = false;

//all text images
PImage titleText;
PImage lostText;
PImage wonText;
PImage pausedText;

//string arr that stores contents of the highSchore.txt
String[] highScoreContents;
PrintWriter writer;

int score = 0;
int prevScore = 0;


void setup() {
	size(1920, 1080);
	background(0);
	imageMode(CENTER);
	rectMode(CENTER);
	textAlign(CENTER, BOTTOM);
	enemyBulls = new ArrayList<EnemyBullet>();

	String imgPath = "assets/images/";
	String soundPath = "assets/sound/";

	//load all text assets
	titleText = loadImage(imgPath + "title.png");
	lostText = loadImage(imgPath + "lost.png");
	wonText = loadImage(imgPath + "won.png");
	pausedText = loadImage(imgPath + "paused.png");

	//load .txt that store highScore; if none exists, create it
	highScoreContents = loadStrings("highScore.txt");
	if (highScoreContents == null) writer = createWriter("highScore.txt");

	//add player
	entities[0] = new Player(100, height/2, loadImage(imgPath + "player.png"));
	//add boss
	entities[1] = new Boss(width-200, height/2, loadImage(imgPath + "boss1.png"));

	//handle explosion/laser assets
	explosionSprite = loadImage(imgPath + "explosion.png");
	explosionSound = new SoundFile(this, sketchPath(soundPath + "explosion.wav"));
	laserSound = new SoundFile(this, sketchPath(soundPath + "laser.wav"));

	//handle music assets
	music = new SoundFile(this, sketchPath(soundPath + "music.wav"));
	music.loop();
	lostMusic = new SoundFile(this, sketchPath(soundPath + "lost.wav"));
	wonMusic = new SoundFile(this, sketchPath(soundPath + "won.wav"));

	//load the stars and put them in the array
	PImage star = loadImage(imgPath + "star.jpg");
	star.resize(87/4, 86/4);

	for (int i = 0; i < numStars; i++) {
		stars[i] = new Star((width/6)*(i/7) + 200, (height/7)*(i%7) + 100, star);
	}
	for (int i = 0; i < numStars; i++) {
		stars[numStars+i] = new Star((width/6)*(i/7)+50, (height/7)*(i%7) + 175, star);
	}
	for (int i = 0; i < 7; i++) {
		stars[(numStars*2)+i] = new Star(width+50, (height/7)*(i%7) + 175, star);
	}
}

void draw() {
	background(0);
	//first step to draw&update stars so they exist in every screen
	for (Star star : stars) {
		star.update();
		star.draw();
	}
	//conditions to check for which screen to be displayed, return to prevent
	//other events from occuring
	if (titleScreen) {
		titleScreen();
		return;
	}
	if (entities[0].health < 0) entities[0].health = 0;
	score = ((500-entities[1].health*10)+stageBonus())*(entities[0].health+1);

	//check to see if highScore.txt should contain new highScore
	if ((playerWon || playerLost) && !scoreUpdated) {
		updateScore();
		scoreUpdated = true;
	}
	if (playerWon) {
		playerWonScreen();
		return;
	}
	if (playerLost) {
		playerLostScreen();
		return;
	}
	drawScore();

	if (isPaused) {
		pausedScreen();
		return;
	}
	if (pausedWait != 0) pausedWait--;
	//check win/lose conditions first
	if (checkWon()) playerWon = true;
	if (checkLost()) playerLost = true;

	//loop through enemyBulls, remove bulls making sure index is correct (i--)
	for (int i = 0; i < enemyBulls.size(); i++) {
		EnemyBullet curr = enemyBulls.get(i);
		//if oob or theres a collision, remove the bull from the array
		if (curr.update() || playerCollision(curr)) {
			enemyBulls.remove(i);
			i--;
			continue;
		}
		curr.draw();
	}

	for (Entity curr : entities) {
		curr.draw();
		curr.update();
	}

	playerCollisionWithBoss();

	input();
	pBullUpdate();
	//keep drawing expllosion while frames left, dont let boss shoot
	//until explosion done
	if (framesForExplosion!=0) {
		drawExplosion();
		return;
	}
	//modulo and int division allow for delays between bullet waves
	if (frameCount%10 == 0 && (frameCount/60)%2 == 0)createEnemyBull();
}

void input() {
	//check the bools corresponding to player movement and do bounds checking
	if (movingDirs[0] && entities[0].y > 100) entities[0].y -= 15;
	if (movingDirs[1] && entities[0].x > 100) entities[0].x -= 15;
	if (movingDirs[2] && entities[0].y < height - 100) entities[0].y += 15;
	if (movingDirs[3] && entities[0].x < width - 100) entities[0].x += 15;
}

void keyPressed() {
	//set bools to true if corresponding key pressed
	//using bools because key can only correspond to a single key at any given time
	//this approach allows for multidirectional movement at any given time
	if (key == 'w') movingDirs[0] = true;
	else if (key == 'a') movingDirs[1] = true;
	else if (key == 's') movingDirs[2] = true;
	else if (key == 'd') movingDirs[3] = true;
	//dont allow player to shoot if enemy is exploding or pBull already created
	else if (key == ' ' && pBull == null && framesForExplosion == 0) createBullet();
	if (pausedWait != 0) {
		pausedWait--; return;
	}
	else if (key == 'p') {
		isPaused = true; pausedWait = 30;
	}
}

void keyReleased() {
	//set bool to false if player releases key
	if (key == 'w') movingDirs[0] = false;
	else if (key == 'a') movingDirs[1] = false;
	else if (key == 's') movingDirs[2] = false;
	else if (key == 'd') movingDirs[3] = false;
}

void createBullet() {
	laserSound.play();
	pBull = new Bullet(entities[0].x + 20, entities[0].y, 20, 0);
}

void pBullUpdate() {
	if (pBull != null) {
		pBull.draw();
		if (bossCollision()) return;
		if (pBull.update()) pBull = null;
	}
}

boolean bossCollision() {
	Entity enemy = entities[1];
	float halfWidth = enemy.imgWidth/2;
	float halfHeight = enemy.imgHeight/2;
	//rectangle collision between pBull and boss
	if (pBull.x > enemy.x - halfWidth && pBull.x < enemy.x + halfWidth &&
		pBull.y > enemy.y - halfHeight && pBull.y < enemy.y + halfWidth) {
			//if collision, decrement boss health and remove pBull
			enemy.health--;
			pBull = null;
			//conditions to check for boss elevating stage
			//set stage and start explosion animation if so
			if (enemy.health == 30) {
				enemyStage = 2;
				framesForExplosion = 120;
				explosionSound.play();
			}
			else if (enemy.health == 10) {
				enemyStage = 3;
				framesForExplosion = 120;
				explosionSound.play();
			}
			return true;
	}
	return false;
}

void playerCollisionWithBoss() {
	Entity player = entities[0];
	Entity enemy = entities[1];
	float halfWidth = enemy.imgWidth/2;
	float halfHeight = enemy.imgHeight/2;
	if (player.x > enemy.x - halfWidth && player.x < enemy.x + halfWidth &&
		player.y > enemy.y - halfHeight && player.y < enemy.y + halfWidth) {
			//if collision, music stops and playerLoses
			music.stop();
			lostMusic.loop();
			entities[0].health = 0;
			playerLost = true;
	}
}

boolean playerCollision(EnemyBullet bull) {
	Entity player = entities[0];
	float halfWidth = player.imgWidth/2;
	float halfHeight = player.imgHeight/2;
	if (bull.x > player.x - halfWidth && bull.x < player.x + halfWidth &&
		bull.y > player.y - halfHeight && bull.y < player.y + halfWidth) {
			//if bull collision, decrement player health
			player.health--;
			return true;
	}
	return false;
}

void createEnemyBull() {
	//laser sound and create bullets based on enemt stage
	laserSound.play();
	int numBulls = enemyBulls.size();
	for (int i = 0; i < enemyStage + (enemyStage-1); i++) {
		enemyBulls.add(new EnemyBullet(entities[1].x, entities[1].y + (20*i)));
	}
	if (enemyStage > 1) {
		for (int i = numBulls; i < numBulls + enemyStage + (enemyStage-1); i++) {
			EnemyBullet currBull = enemyBulls.get(i);
			//set the vels to allow for tracking to last player position
			currBull.xVel = (currBull.x - entities[0].x) * (-.01*enemyStage);
			currBull.yVel = (currBull.y - entities[0].y) * (-.01*enemyStage);
		}
	}
}

void drawExplosion() {
	//alternate between showing and not showing explosion
	if ((frameCount/20)%2 == 0) {
		image(explosionSprite, entities[1].x, entities[1].y);
	}
}

void titleScreen() {
	if ((frameCount/60)%2 == 0) image(titleText, width/2, height/2);
	if (keyPressed && key == ENTER) titleScreen = false;
}

void pausedScreen() {
	//flash the paused sign
	if ((frameCount/60)%2 == 0) image(pausedText, width/2, height/2);
	if (pausedWait != 0) {
		pausedWait--; return;
	}
	//if p pressed again, return to game
	if (keyPressed && key == 'p') {
		isPaused = false; pausedWait = 30;
	}
}


void playerLostScreen() {
	fill(255);
	image(lostText, width/2, height*.25);
	text("YOUR SCORE:" + str(score), width/2, height/2);
	if (score > prevScore) text("NEW HIGH SCORE!!!", width/2, height*.75);
	else text("PREVIOUS SCORE:" + str(prevScore), width/2, height*.75);
}

void playerWonScreen() {
	fill(255);
	image(wonText, width/2, height*.25);
	text("YOUR SCORE:" + str(score), width/2, height/2);
	if (score > prevScore) text("NEW HIGH SCORE!!!", width/2, height*.75);
	else text("PREVIOUS SCORE:" + str(prevScore), width/2, height*.75);

}


boolean checkWon() {
	if (entities[1].health < 1) {
		music.stop();
		wonMusic.loop();
		return true;
	}
	return false;
}

boolean checkLost() {
	//neg health can occur when multiple bullets shot at same time
	if (entities[0].health < 1) {
		music.stop();
		lostMusic.loop();
		return true;
	}
	return false;
}

void drawScore() {
	fill(255);
	textSize(75);
	text(score, width*.66, height-50);
}

int stageBonus() {
	if (enemyStage==1) return 0;
	if (enemyStage==2) return 500;
	return 1000;
}

void updateScore() {
	highScoreContents = loadStrings("highScore.txt");
	if (highScoreContents.length != 0) prevScore = int(highScoreContents[0]);
	if (highScoreContents.length == 0 || score > int(highScoreContents[0])) {
		highScoreContents = new String[1];
		highScoreContents[0] = str(score);
		saveStrings("highScore.txt", highScoreContents);
	}
}
