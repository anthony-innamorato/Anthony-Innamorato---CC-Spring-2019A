Entity[] entities = new Entity[2];
//in format w, a, s, d
boolean[] movingDirs = new boolean[4];
Bullet pBull;
ArrayList<EnemyBullet> enemyBulls;
int numStars = 42;
Star[] stars = new Star[(numStars*2) + 7];
int enemyStage = 1;
int framesForExplosion = 0;
PImage explosionSprite;

void setup() {
	size(1920, 1080);
	background(0);
	imageMode(CENTER);
	rectMode(CENTER);
	enemyBulls = new ArrayList<EnemyBullet>();

	//add player
	entities[0] = new Player(100, height/2, loadImage("assets/player.png"));
	//add boss
	entities[1] = new Boss(width-200, height/2, loadImage("assets/boss1.png"));

	explosionSprite = loadImage("assets/explosion.png");

	PImage star = loadImage("assets/star.jpg");
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

	for (Star star : stars) {
		star.update();
		star.draw();
	}

	for (int i = 0; i < enemyBulls.size(); i++) {
		EnemyBullet curr = enemyBulls.get(i);
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

	input();
	pBullUpdate();
	if (framesForExplosion!=0) {
		drawExplosion();
		return;
	}
	if (frameCount%10 == 0 && (frameCount/60)%2 == 0)createEnemyBull();
	println(framesForExplosion);
}

void input() {
	if (movingDirs[0] && entities[0].y > 100) entities[0].y -= 15;
	if (movingDirs[1] && entities[0].x > 100) entities[0].x -= 15;
	if (movingDirs[2] && entities[0].y < height - 100) entities[0].y += 15;
	if (movingDirs[3] && entities[0].x < width - 100) entities[0].x += 15;
}

void keyPressed() {
	if (key == 'w') movingDirs[0] = true;
	else if (key == 'a') movingDirs[1] = true;
	else if (key == 's') movingDirs[2] = true;
	else if (key == 'd') movingDirs[3] = true;
	if (key == ' ' && pBull == null && framesForExplosion == 0) createBullet();
}

void keyReleased() {
	if (key == 'w') movingDirs[0] = false;
	else if (key == 'a') movingDirs[1] = false;
	else if (key == 's') movingDirs[2] = false;
	else if (key == 'd') movingDirs[3] = false;
}

void createBullet() {
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
	if (pBull.x > enemy.x - halfWidth && pBull.x < enemy.x + halfWidth &&
		pBull.y > enemy.y - halfHeight && pBull.y < enemy.y + halfWidth) {
			enemy.health--;
			pBull = null;
			if (enemy.health == 30) {
				enemyStage = 2;
				framesForExplosion = 120;
			}
			else if (enemy.health == 10) {
				enemyStage = 3;
				framesForExplosion = 120;
			}
			return true;
	}
	return false;
}

boolean playerCollision(EnemyBullet bull) {
	Entity player = entities[0];
	float halfWidth = player.imgWidth/2;
	float halfHeight = player.imgHeight/2;
	if (bull.x > player.x - halfWidth && bull.x < player.x + halfWidth &&
		bull.y > player.y - halfHeight && bull.y < player.y + halfWidth) {
			player.health--;
			return true;
	}
	return false;
}

void createEnemyBull() {
	for (int i = 0; i < enemyStage + (enemyStage-1); i++) {
		enemyBulls.add(new EnemyBullet(entities[1].x, entities[1].y + (20*i)));
	}
}

void drawExplosion() {
	image(explosionSprite, entities[1].x, entities[1].y);
}